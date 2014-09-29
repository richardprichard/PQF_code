
# code for receiving data
# this is designed to run every hour
# it will check for new mail,
# download any + xlsx attachments
# translate them
# and update the appropriate records
# -----------------------------------------------
library(openxlsx)
library(rPython)
library(knitr)

library(stringr)
library(reshape2)
library(plyr)
library(dplyr)
library(lubridate)


# set global variables
# -----------------------------------------------
setwd("~/Dropbox/PQF/") 

python.load("code/framework_mail2.py") # load the python mail functions

maxdays <- 1000 # applications will fail verification if they take longer than 3 years
start_date <- dmy('01/06/2012') # elapsed months etc work from this date
end_date <- dmy('31/06/2014') # applications after this date discarded. I've tried to make this a whole number of quarters. 
todays_date <- as.character(ymd(today()))
missing <- "* missing *"

# load in the system inputs from the excel sheets
# --------------------------------------------------
t <- "masters/master_lookups.xlsx"
places <- readWorkbook(t, 'places')
labels <- readWorkbook(t, 'labels')
labels_orig <- labels
development <- readWorkbook(t, 'development')
whatnext <- readWorkbook(t, 'whatnext')
howto_apps <- readWorkbook(t, 'howto_apps')
fieldlist <- readWorkbook(t, 'fieldlist')
rm(t)
t <- "logs/email_log.xlsx"
emails <- readWorkbook(t, 'submit')
old_uids <- select(emails, email_UID)
old_uids$email_UID <- as.character(old_uids$email_UID)
rm(t)

labels$composite_lookup <- paste(labels$list, labels$shortname, sep="_")
labels$list <- as.factor(labels$list)
labels$shortname <- as.factor(labels$shortname)
labels$group <- as.factor(labels$group)
labels$composite_lookup <- as.factor(labels$composite_lookup)
mappings <- unique(labels$list) # this creates the list of maps to cycle through
labels <- select(labels, composite_lookup, group, val) # ignore notes etc
# ditto for development
development <- select(development, system_value, dev_group:investment)
development$system_value <- as.factor(development$system_value)
development$dev_group <- as.factor(development$dev_group)



# helper functions
# -------------------------

check_date <- function(x) { # helper fn to ensure that dates were detected properly on import and round them
  if (is.POSIXct(x)) return(round(x,"days")) # it's OK
  if (is.numeric(x)) return(as.POSIXct(convertToDate(round(x,0))))
  #t <- try(x <- as.numeric(x)) # attempt to convert to number
  #if (class(t) == "try-error") return(0)
  x <- as.numeric(x)
  return(as.POSIXct(convertToDate(round(x,0)))) # otherwise convert 
}

check_fields <- function(tableA, tableB) { # where A is the master and B is to be checked
  # there are potentially three sets - fields in both 'success', fields in only A 'missing' and fields only in B 'ignored'
  success <- semi_join(tableA, tableB, by='fields')
  success <- mutate(success, result = 'success')
  fail <- anti_join(tableA, tableB, by='fields')
  fail <- mutate(fail, result = missing)
  ignored <- anti_join(tableB, tableA, by='fields')
  ignored <- mutate(ignored, result = 'ignored')
  
  r <- rbind(success, fail, ignored)
  return(arrange(r, fields))
}

translate_file <- function(filename) {
  #filename <- 'inputs/from_email/sent_in/TBCouncil.xlsx'
  lookups <- data.frame('council'=character(), 'list'=character(), 'local_value'=character(),
                        'local_notes'=character(),'system_value'=character(),
                        'system_count'=character(), 'system_notes'=character())
  msg <- ''
  
  result <- try (maps <- readWorkbook(filename, 'lookups'))
  result <- try (apps <- readWorkbook(filename, 'applications'))
  
  if (class(result) == "try-error") { # we could not find a worksheet called 'applications'
    msg <- str_c('I found an attachment with the correct suffix, but not a sheet called applications')
  } else {
    rm(result)
    council <- as.character(apps$council[1])
    apps_orig <- apps
    maps_orig <- maps
    i <- sapply(maps, is.character)  # convert to factors
    maps[i] <- lapply(maps[i], as.factor)
    
    # check that the input file has the correct field names
    fields_B <- as.data.frame(colnames(apps), stringsAsFactors=FALSE)
    colnames(fields_B) <- 'fields'
    fields_A <- select(filter(fieldlist, file == 'applications'), fields)
    app_check <- check_fields(fields_A, fields_B)
    fields_B <- as.data.frame(colnames(lookups), stringsAsFactors=FALSE)
    colnames(fields_B) <- 'fields'
    fields_A <- select(filter(fieldlist, file == 'lookups'), fields)
    lookup_check <- check_fields(fields_A, fields_B)
    
    # test to see if anything is missing
    i <- filter(app_check, result==missing)
    j <- filter(lookup_check, result == missing)
    
    if(length(i$fields) + length(j$fields) > 0) {
      msg <- str_c("There was a problem with the field names that needs fixing before we can process your data. ",
                   "They need to be an exact match (look out for a stray capital letter or space). ",
                   "If you do not have the data for a field, then submit a blank column but with the correct heading. ",
                   "<br />A field comparison follows:",
                   kable(app_check, format='html', ouput=FALSE),
                   "<br />And the lookups:<br />",
                   kable(lookup_check, format='html', output=FALSE),
                   "<br />Attached is the spreadsheet with the framework version of your data. ",
                   'Please follow the simple instructions on our <a href="http://qualityframework.net/get-started/1st-steps-application-data/"> webpage (Stage 2)</a>',
                   'to update the field names and re-submit. ')
      
      newname <- str_replace(filename, 'sent_in', 'sent_out') # move the submitted file to /sent_out 
      
      wb <- createWorkbook()
      addWorksheet(wb, 'guide')
      addWorksheet(wb, 'applications')
      addWorksheet(wb, 'lookups')
      addWorksheet(wb, 'master_development')
      addWorksheet(wb, 'master_lookups')
      writeData(wb, 'guide', x=howto_apps, colNames=TRUE)
      writeData(wb, 'applications', x=apps_orig, colNames=TRUE)
      writeData(wb, 'lookups', x=lookups, colNames=TRUE)
      writeData(wb, 'master_development', x=development, colNames=TRUE)
      writeData(wb, 'master_lookups', x=labels_orig, colNames=TRUE)
      saveWorkbook(wb, newname, overwrite = TRUE)
      rm(wb) 
      return(msg)  # bail out. Can't proceed without columns
    }
    
    
    # concatenate development cateogry and application to unpack Q28 etc
    apps$dev <- str_c(apps$development_category, apps$application_type, sep="_")
    place_temp <- select(places, council, code, price_weight)
    place_temp$council <- as.factor(place_temp$council)
    # turn the various lookups into factors (will make it all quicker)
    apps$council <- as.factor(apps$council)
    apps$application_type <- as.factor(apps$application_type)
    apps$dev <- as.factor(apps$dev)
    apps$application_status <- as.factor(apps$application_status)
    apps$decision_route <- as.factor(apps$decision_route)
    apps$decision_recommended <- as.factor(apps$decision_recommended)
    apps$decision_issued <- as.factor(apps$decision_issued)
    
    apps$date_valid <- check_date(apps$date_valid)
    apps$date_received <- check_date(apps$date_received)
    apps$date_decision_made <- check_date(apps$date_decision_made)
    apps$date_decision_issued <- check_date(apps$date_decision_issued)
    
    apps$date_error <- 0 # if it's still zero at the end it's passed all the tests  
    # calculate the fields derived directly from the data
    apps$days_makevalid <- as.numeric(difftime(apps$date_valid, apps$date_received, units=c("day")))
    apps$days_validtodecision <- as.numeric(difftime(apps$date_decision_issued, apps$date_valid, units=c("day")))
    apps$days_receipttodecision <- as.numeric(difftime(apps$date_decision_issued, apps$date_received, units=c("day")))
    
    # and check that dates make sense
    # do dates go backward ? or bigger than our limit ? or in the future ?  
    apps$date_error <- 0+ ifelse(is.na(apps$date_received),1,0) + ifelse(is.na(apps$date_valid),1,0)
    apps$date_error <- apps$date_error + ifelse(is.na(apps$date_decision_made),1,0) + ifelse(is.na(apps$decision_issued),1,0)
    apps$date_error <- apps$date_error + ifelse(apps$date_received < start_date,1,0) + ifelse(apps$date_received > end_date,1,0)
    
    apps$date_error <- apps$date_error + ifelse(apps$days_makevalid<0,1,0) + ifelse(apps$days_makevalid>maxdays,1,0) +
      ifelse(apps$days_validtodecision<0,1,0) + ifelse(apps$days_validtodecision>maxdays,1,0) + 
      ifelse(apps$days_receipttodecision<0,1,0) + ifelse(apps$days_receipttodecision>maxdays,1,0)
    
    apps$date_error <- apps$date_error + ifelse(apps$date_valid > todays_date,1,0) +
      ifelse(apps$date_decision_made > todays_date,1,0) + ifelse(apps$date_decision_issued > todays_date,1,0)
    
    # -------------------------------------------------------------------------
    # list and dump records with malformed dates, as they just create annoying factors
    
    #date_problems <- filter(apps, date_error>0) # this will be written into the xls file
    date_problems <- filter(apps, date_error>0 | is.na(date_error)) # this will be written into the xls file
    apps <-filter(apps, date_error == 0 | is.na(date_error)) # remove them from subsequent work
    #apps <-filter(apps, date_error == 0)
    
    # -----------------------------------------------------------------------------
    
    # to group applications around when they're received:
    apps$received_month <- as.integer(
      (year(apps$date_received) - year(start_date)) * 12 + 
        month(apps$date_received) - month(start_date))+1
    # apps$received_quarter <- str_join("Q", floor(apps$received_month/3))
    apps$received_quarter <- str_join("Q", round((apps$received_month+1)/3,0))
    
    # to group applications around when they're decided:
    apps$decision_month <- as.integer(
      (year(apps$date_decision_issued) - year(start_date)) * 12 + 
        month(apps$date_decision_issued) - month(start_date)) +1
    apps$decision_quarter <- str_join("Q", round((apps$decision_month+1)/3,0))
    apps$is_valid_day1 <-ifelse(apps$date_valid == apps$date_received,1,0)
    apps$is_8wk <- ifelse(apps$days_validtodecision <= 8*7,1,0)
    apps$is_13wk <- ifelse(apps$days_validtodecision <= 13*7,1,0)
    apps$is_26wk <- ifelse(apps$days_validtodecision <= 26*7,1,0)
    apps$is_zero_fee <- ifelse((apps$application_fee ==0 | is.na(apps$application_fee)),1,0)
    # portal applications are those that have a code (PP12345) or a 'Y'
    apps$is_portal <- ifelse(str_length(apps$portal)>1,1,0) + ifelse(str_detect(apps$portal, ignore.case('Y')),1,0)
    
    
    # Joining job 1------------------------------------------
    # join to the 'place' master reference tables
    apps <- left_join(apps, place_temp, by='council', copy = "TRUE") # this brings in a field called "code" and an index relating to houseprice
    
    # Joining job 2 -----------------------------------------
    # join to the label lookups (of which there are 5)
    # for each of the five lookups, we do a double look-up to bring across the masters
    
    for (i in mappings) {  # i<- mappings[1]
      apps$composite_lookup <- as.factor(paste(i, apps[[i]], sep='_')) # make composite
      maps_subset <- filter(maps, list == i)
      if (length(maps_subset$system_value) == 0) { # nothing to lookup !
        apps[c(str_join(i,'_sys'), str_join(i,'_val'), str_join(i,'_group'))] <- NA # add empty columns
        temp <- data.frame('council' = council, 'list' = i, 'local_value' = apps[[i]],
                           'local_notes' = missing, 'system_count' = 1, 'system_value' = missing)
        lookups <- rbind(lookups,temp)
        next
      }
      maps_subset$composite_lookup <- as.factor(paste(i, tolower(maps_subset$system_value), sep="_")) # make composite that matches from the local to the system
      # tweaked to make the council's version of the system value lower case
      maps_subset <- left_join(maps_subset, labels, by=c('composite_lookup'), copy='TRUE')
      maps_subset$composite_lookup <- as.factor(paste(i, maps_subset$local_value, sep="_")) # make composite that matches from the local to the system)
      maps_subset = select(maps_subset, composite_lookup, local_notes, system_value, group, val)
      
      apps <- left_join(apps, maps_subset, by=c('composite_lookup'), copy = "TRUE")
      temp <- data.frame('council' = council, 'list' = i, 'local_value' = apps[[i]],
                         'local_notes' = apps$local_notes, 'system_value' = apps$system_value, 'system_count' = 1) 
      
      lookups <- rbind(lookups,temp) 
      
      names(apps)[names(apps)=="system_value"] <- str_join(i, "_sys") # change the field name to map against the one just joined to the main table
      names(apps)[names(apps)=="val"] <- str_join(i, "_val") # change the field name to map against the one just joined to the main table
      names(apps)[names(apps)=="group"] <- str_join(i, "_group") # change the field name to map against the one just joined to the main table
      apps <- select(apps, -local_notes)
    }
    apps <- select(apps, -composite_lookup)
    
    # joining job 3 -----------------------------
    
    # translate from the council's local reference to our development_categories

    list_name <- 'development_category'
    council_dev <- filter(maps, list == list_name)
    
    if (length(council_dev$council) == 0) { # no lookups supplied !
      apps[c('dev_group', 'hours', 'investment', 'value')] <- NA # add empty columns
      
      apps_temp <- data.frame('council' = council, 'list' = list_name, 
                              'local_value' = apps$dev,
                              'local_notes' = '', 
                              'system_value' = missing, 'system_count' = 1)
      lookups <- rbind(lookups, apps_temp)  
    } else {
      council_dev <- select(council_dev, local_value:system_value)      
      council_dev <- left_join(council_dev, development, by = c('system_value'))
      council_dev <- rename(council_dev, replace = c(local_value='dev'))
      
      apps <- left_join(apps, council_dev, by=c('dev'), copy="TRUE")
      
      success <- data.frame('council' = council, 'list' = list_name,
                            'local_value' = apps$dev, 
                            'local_notes' = apps$local_notes,
                            'system_value' = apps$system_value, 
                            'system_count' = 1)
      lookups <- rbind(lookups, success)
      apps$value <- apps$investment * apps$price_weight
      apps <- select(apps, -local_notes)
    }
    
    # process all the lookups we've been hoovering up as we've been going along
    i <- sapply(lookups, is.factor)     # convert from factors to text
    lookups[i] <- lapply(lookups[i], as.character) # convert from factors back to character
    # treat NAs that are a result of missing original data differently to NAs that are unmatched
    lookups$local_value[is.na(lookups$local_value)] <- 'blank'
    lookups$local_notes[lookups$local_value == 'blank'] <- 'blank'
    lookups$system_value[lookups$local_value == 'blank'] <- 'blank'
    
    # remaining NAs are because stuff is missing
    lookups$system_value[is.na(lookups$system_value)] <- missing
    
    lookups <- group_by(lookups, council, list, local_value, local_notes, system_value)
    lookups <- summarise(lookups, system_count=sum(system_count))
    lookups <- arrange(lookups, list, desc(system_count))
    
    # save the translated file in sent_out  
    
    newname <- str_replace(filename, 'sent_in', 'sent_out')
    
    wb <- createWorkbook()
    addWorksheet(wb, 'guide')
    addWorksheet(wb, 'applications')
    addWorksheet(wb, 'lookups')
    addWorksheet(wb, 'date_errors')
    addWorksheet(wb, 'translated')
    addWorksheet(wb, 'master_development')
    addWorksheet(wb, 'master_lookups')
    writeData(wb, 'guide', x=whatnext, colNames=TRUE)
    writeData(wb, 'translated', x=apps, colNames=TRUE)
    writeData(wb, 'date_errors', x=date_problems, colNames=TRUE)
    writeData(wb, 'applications', x=apps_orig, colNames=TRUE)
    writeData(wb, 'lookups', x=lookups, colNames=TRUE)
    writeData(wb, 'master_development', x=development, colNames=TRUE)
    writeData(wb, 'master_lookups', x=labels_orig, colNames=TRUE)
    saveWorkbook(wb, newname, overwrite = TRUE)
    rm(wb)
    
    # calc success
    matched <- filter(lookups, system_value != missing)
    unmatched <- filter(lookups, system_value == missing)
    
    match_y <- sum(matched$system_count)
    match_n <- sum(unmatched$system_count)
    perc = round(match_y / (match_y+match_n) * 100,0)
    top_miss <- unmatched$local_value[unmatched$system_count == max(unmatched$system_count)]
  
    msg <- str_c('To fit your data into the framework, we need your help to map your codes for things ',
                 'to the Quality Framework standards using a dictionary of lookups. ',
                 'The spreadsheet received contained ', length(apps$council),' application records. ',
                 'Each record requires several lookups so the maximum matches to make is ',sum(lookups$system_count),
                 'Using the lookups supplied we could match ',match_y, ' which equates to ',perc,'%. ',
                 '<br /> Follow the instructions on our <a href="http://qualityframework.net/get-started/1st-steps-application-data/"> webpage (Stage 3)</a>',
                 'to complete the lookups and resubmit.<br />')
  }
  return(msg)
}

get_new_mail_uids <- function(old_uids) {
  t <- python.call("get_inbox") # Login and see what's there
  result <- t$result
  data <- t$data
  new_mails <- 'none'
  if (result == 'OK') { # we found an imap server
    uid_list <- strsplit(data, ' ')[[1]]   # data is just a string. Convert it to a list of UIDs
    df_uids <- melt(uid_list, value.name = "email_UID")
    df_uids$email_UID <- as.character(df_uids$email_UID) # this is the list of UIDs in the email list
    
    # join the two sets of UIDs so we can see what's new
    new_mails <- anti_join(df_uids, old_uids, by = "email_UID")
  }
  return(new_mails)
}

get_mail <- function(fetch_uid) { # requires 'emails' global
  #fetch_uid = "45"
  setwd("~/Dropbox/PQF/inputs/from_email/sent_in") 
  t <- python.call("fetch_mail", fetch_uid)
  setwd("~/Dropbox/PQF")
  from <- t[['mail_from']]
  subject <- t[['mail_subject']]
  timestamp <- t[['mail_date']]
  attachment_name <- t[['mail_attachment_name']]
  processed <- todays_date
  m <- data.frame(timestamp, 'email_UID' = fetch_uid, subject, from, council, processed, 
                  attachment_name, 'replied' = ret)
  i <- sapply(m, is.factor)
  m[i] <- lapply(m[i], as.character) # convert from factors
  emails <- rbind(emails, m)   # update 'mail log'emails' data frame
  
  t <- "logs/email_log.xlsx"
  wb <- loadWorkbook(t)
  removeWorksheet(wb, 'submit') # remove old log
  addWorksheet(wb, 'submit')
  writeData(wb, 'submit', emails) # replace
  saveWorkbook(wb, file=t, overwrite = TRUE)
  rm(wb)
}
  
  
  
  
  council <- 'no match'
  ret <- 'no reply sent'
  if (attachment_name != 'None') { # try to match to a council
    t <- filter(places, filename == attachment_name)
    council <- t$council # match (hopefully)
    if (length(council)==0) { 
      council <- 'not in register'
    } else {
      f <- str_join('inputs/from_email/sent_in/', attachment_name)
      # -- jump !
      msg <- translate_file(f) # this reads from sent_in and writes to sent_out
      setwd('~/Dropbox/PQF/inputs/from_email/sent_out')
      ret <- python.call("send_mail", attachment_name, as.character(msg), from) # use python code to send
      setwd("~/Dropbox/PQF")
      update_place_log(council, msg)  
    }
    
  }
  
  return(emails)
}


update_place_log <- function(council, notes) {
  t <- "masters/master_lookups.xlsx"
  if (str_length(notes) > 250) {
    notes <- str_sub(notes, 1, 249) # just take the first 250
  }
  wb <- loadWorkbook(xlsxFile = t)
  places <- readWorkbook(t, 'places')
  places$last_submission[places$council == council] <- todays_date
  places$notes[places$council == council] <- notes
  removeWorksheet(wb, 'places') # remove old log
  addWorksheet(wb, 'places')
  writeData(wb, 'places', places) # replace
  saveWorkbook(wb, file=t, overwrite = TRUE)
  rm(wb)
}


# -------------------------------------------------------
# to process from emails:
new_mail <- get_new_mail_uids(old_uids)
 #uid <- '46'

for (uid in new_mail$email_UID) {
  print(str_c("Processing mail ",uid))
  
  emails <- process_mail(uid)
  update_submit_log(emails)
}
  

# --------------------------------------
# to process from files on the system
setwd("~/Dropbox/PQF/inputs/from_email/sent_in") 
filenames <- list.files(pattern = "*.xlsx", full.names=TRUE)
setwd("~/Dropbox/PQF")
for (name in filenames) {
  name <- str_c('inputs/from_email/sent_in/', name)
  print(name)
  r <- translate_file(name)
  print(r)
  
}






