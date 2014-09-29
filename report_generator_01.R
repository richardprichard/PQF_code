
library(ggplot2)
library(RColorBrewer)
library(scales)
library(plyr)
library(dplyr)
library(stringr)
library(lubridate)
library(reshape2)
library(knitr)
library(markdown)
library(R2HTML)
library(gridExtra)

library(openxlsx)
library(tidyr)
library(rPython)

# --------------------------------------------------------
# Global variables
report_date <- as.character(today())
setwd("~/Dropbox/PQF/") 
python.load("code/framework_mail.py") # load the python mail functions

t <- "masters/master_lookups.xlsx"
places <- readWorkbook(t, 'places')

#---------------------------------------------------------
# drawing functions - so that any tweaks etc are easily applied

plot_over_time <- function() {  # summarise stuff and plot it 
  # this is from the new dplyr package. See the vignette.
  # begin by summing the values
  arrange(i, council, lead_x) # arrange in order of the x axis
  x_points <- group_by(i, lead_x, council)
  if (plot_type == 'sum') i <- summarise(x_points, lead_val = sum(lead_val, na.rm=TRUE))
  if (plot_type == 'count') i <- summarise(x_points, lead_val = n(lead_val, na.rm=TRUE))
  if (plot_type == 'mean') i <- summarise(x_points, lead_val = mean(lead_val, na.rm=TRUE))
  if (plot_type == 'percent') i <- summarise(x_points, lead_val = mean(lead_val, na.rm=TRUE))
  arrange(j, council, group_x) # arrange in order of the x axis
  x_points <- group_by(j, group_x, council)
  if (plot_type == 'sum') j <- summarise(x_points, group_val = sum(group_val, na.rm=TRUE))
  if (plot_type == 'count') j <- summarise(x_points, group_val = n(group_val, na.rm=TRUE))
  if (plot_type == 'mean') j <- summarise(x_points, group_val = mean(group_val, na.rm=TRUE))
  if (plot_type == 'percent') j <- summarise(x_points, group_val = mean(group_val, na.rm=TRUE))
  p <- ggplot()
  p <- p + geom_line(data=j, aes(x=group_x, y=group_val, colour=council, group=council), size=1)
  p <- p + stat_smooth(data=j, aes(x=group_x, y=group_val, group=1), method="loess", colour="black")
  p <- p + geom_line(data=i, aes(x=lead_x, y=lead_val, colour=council, group=council), size=2)
  p <- p + stat_smooth(data=i, aes(x=lead_x, y=lead_val, group=1), method="lm", se=FALSE, colour="red", size=2)
  if (plot_type == 'percent') {
    p <- p + scale_y_continuous(labels = percent)
    p <- p + coord_cartesian(ylim = y_lims)
  }
  p <- p + labs(title = t, x=x_label, y=y_label)
  return(p)
}

# table helper
report_table <- function(data) {  # print table without dp
  kable(data, digits=0, format="html", row.names=FALSE)
#  HTML(data, file="",Border=1, align="right", digits=0,row.names=FALSE)
}

# this table helper works out how many of your table i the i$cat  is
make_prop_table <- function(i, t) {
# this works out what proportion of the whole each i$cat is for summarising tables
# by category
  a <- filter(i, council == report_lead)
  b <- filter(i, council != report_lead)
  a.summary <- a %.%
    group_by(cat) %.%
    summarise(n=n()) %.%
    mutate(perc = sprintf("%.0f%%", n/sum(n)*100))
  a.summary <- rename(a.summary, replace=c(cat=t, n='your count', perc='your perc'))
  
  b.summary <- b %.%
    group_by(cat) %.%
    summarise(n=n()) %.%
    mutate(perc = sprintf("%.0f%%", n/sum(n)*100))
  b.summary <- rename(b.summary, replace=c(cat=t, n='their count', perc='their perc'))
  
  c <- join(a.summary, b.summary, by=t, type="full")    
  return(c[order(c[,1]),]) # return c sorted by 1st col
}

make_perc_table <- function(i, t) { 
# this helper averages values passed to it in table 'i'
# it breaks the table into categories and then means the val 
  a <- filter(i, council == report_lead)
  b <- filter(i, council != report_lead)  
  
  a.summary <- a %.%
    group_by(cat) %.%
    summarise(count=n(),
              perc=sprintf("%.0f%%",mean(val, na.rm=TRUE)*100)) 
  a.summary <- rename(a.summary, replace=c(cat=t, count='your count', perc='your %age'))
  
  b.summary <- b %.%
    group_by(cat) %.%
    summarise(count =n(),
              perc=sprintf("%.0f%%",mean(val, na.rm=TRUE)*100)) 
  b.summary <- rename(b.summary, replace=c(cat=t, count='their count', perc='their %age'))
  c <- join(a.summary, b.summary, by=t, type="full")
  
  return(c[order(c[,1]),]) # return c sorted by 1st col
}

plot_table <- function(i, t) {
  p <- ggplot(data=i, aes(x=council, fill=cat))
  p <- p + geom_bar(position="fill")
  p <- p + scale_y_continuous(labels = percent)
  p <- p + labs(title = t)
 # p <- p + coord_flip() 
  return(p)
}


# -----------------------------------------------------------
# data helper functions

cleanup <- function(app) { #this refactorises etc the xlsx files
  #app <- whole_set
  # start by selecting only the columns we need:
  app <- select(app, council, portal, application_fee, days_makevalid:value)
  # factorise all columns that are chr
  
  i <- sapply(app, is.character) 
  app[i] <- lapply(app[i], as.factor) # convert from factors back to character
  
  return(app)
}


assemble_data <- function(subject, sample) {
  #subject <- 'hastings' subject<- 'Ealing' subject <- 'ashford'
  setwd("~/Dropbox/PQF/inputs/from_email/sent_out") 
  
  this_council <- filter(places, council==subject)
  i <- select(this_council, council, report_group)
  files <- unlist(str_split(as.character(i$report_group), ' ')) 
    
  tables <- lapply(files, function(i) {
    print (i)
    readWorkbook(i, 'translated')
  })
  dataset <- do.call(rbind.fill, tables)
  if (sample == TRUE) { # reduce all datasets to the size of the smallest council
    councils <- group_by(dataset, council)
    councilcount <- summarise(councils, count=n())
    smallestcouncil <- min(councilcount$count)
    
    for (c in councilcount$council) {
      thiscouncil <- filter(dataset, council ==c)
      dataset <- filter(dataset, council != c)
      thiscouncil <- sample_n(thiscouncil, smallestcouncil)
      dataset <- rbind(dataset, thiscouncil)
    }
  } 
  rm(tables)
  setwd("~/Dropbox/PQF")
  dataset$application_fee <- as.numeric(dataset$application_fee)
  return(cleanup(dataset))
}


# --------------------------------------------------


setwd("~/Dropbox/PQF/") 
pilots <- list('hastings', 'ashford', 'ealing', 'haringey')
report_date <- as.character(ymd(today()))
sample <- FALSE
#sample <- TRUE

for (pilot in pilots) { # pilot<-'haringey'
  suffix <- ifelse(sample==TRUE,"_resize","_orig")
  report_lead <- pilot
  output_file <- str_c('~/Dropbox/PQF/outputs/',report_lead,suffix,'.html')
  print(report_lead)
  whole_set <- assemble_data(subject=pilot, sample)
  lead_council <- filter(whole_set, council == pilot)
  comparator_group <- filter(whole_set, council != pilot)
  # fire off each report
  setwd("~/Dropbox/PQF/code")
  knit("_report_markdown7.Rmd")
  markdownToHTML("_report_markdown7.md", output=output_file, stylesheet='pas-report-style.css', encoding='windows-1252')
}


