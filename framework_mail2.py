
# -*- coding: utf-8 -*-
"""
framework_mail
python functions for contacting, downloading email list and fetching individual emails

"""

import imaplib
import smtplib
import email
import os
import sys, traceback

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.MIMEBase import MIMEBase
from email import Encoders

#from BeautifulSoup import BeautifulSoup

# from nltk import clean_html

fromaddr = "submit@qualityframework.net"
replyto = fromaddr
msgsubject = 'Thank you for submitting data to the PQF'


# =======================================================
def grab_attachment(msg):
    filename = "None"
    attachment = "None"
    for part in msg.walk():
        print ("%s, %s" % (part.get_content_type(), part.get_content_charset()))
        if part.get_content_maintype() == 'multipart':  # this is just a placeholder
            continue
        filename = part.get_filename()
        if not filename:
            continue
        if not filename.endswith("xlsx"):
            print ("attachment %s" %filename)
            filename = "xlsx attachment not found"
            continue
        charset = part.get_content_charset()
        attachment = part.get_payload(decode=True)        

        file = open(filename, "w") # in the current working directory
        file.write(attachment)
        file.close()        
    if filename is None:
      filename = "None"
    return(filename)

# =======================================================
def get_inbox():
    mail = imaplib.IMAP4_SSL('shcp10.hosting.zen.net.uk', '993')
    mail.login('submit@qualityframework.net', 'pasknowledge01')
    mail.select('INBOX')
    result, data = mail.uid('search', None, "ALL") # search and return uids instead
    return {'result':result, 'data':data }

# ========================================================
def fetch_mail(fetch_uid): 
    mail_from = "error"
    mail_date = "error"
    mail_subject = "error"
    mail_attachment_name = "error"
    mail_attachment = "NA"    
    mail = imaplib.IMAP4_SSL('shcp10.hosting.zen.net.uk', '993')
    mail.login('submit@qualityframework.net', 'pasknowledge01')
    mail.select('INBOX')
    result, data = mail.uid('fetch', fetch_uid, '(RFC822)')
    if result == 'OK':
        raw_email = data[0][1]
        e = email.message_from_string(raw_email)
        #e = email.message_from_bytes(raw_email) # works in python 3.4
        
        mail_status = result
        mail_from = e['From']
        mail_date = e['Date']
        mail_subject = e['Subject']
        mail_attachment_name = grab_attachment(e) # note this also saves the attachment
        
    return {'mail_from': mail_from, 'mail_date': mail_date,
            'mail_subject': mail_subject, 'mail_status': mail_status,
            'mail_attachment_name': mail_attachment_name}

def send_mail(filename, message, toaddr):
  # toaddr = "richard <richard.crawley@local.gov.uk>"
  
  text = "Thanks\nThis is confirmation that we have safely received your data. This is an automated account - please don't reply to it with anything you need a human to see.\n " + message + "Attached is a spreadsheet with the framework version of your data. Please follow the simple instructions in the attached spreadsheet, update the lookups and dates and re-submit it. "
  
  html_head = """\
<html>
  <head>Thanks</head>
  <body>
    <p><br>
       This is confirmation that we have safely received your data. This is an automated account - please don't reply to it with anything you need a human to see.<br>
"""

  html_bottom = """\
<br>Attached is the spreadsheet with the framework version of your data. Please follow the simple instructions in the attached spreadsheet, update the lookups and dates and re-submit it. <br>
    </p>
  </body>
</html>
"""

  html = html_head + message + html_bottom
# Record the MIME types of both parts - text/plain and text/html.

  print("begin try")
  try:
    msg = MIMEMultipart('alternative') # for combined html and plain text
    msg.preamble = 'This is a multi-part message in MIME format.n'
    msg.epilogue = ''
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Thank you for submitting data to the quality framework"  
    
    # soup = BeautifulSoup(text) # disredarding soup
    part1 = MIMEText(text, 'plain')
    part2 = MIMEText(html, 'html')

# Attach parts into message container.
# According to RFC 2046, the last part of a multipart message, in this case
# the HTML message, is best and preferred.
    msg.attach(part1)
    msg.attach(part2)
    print("done attaching")

    part = MIMEBase('application', 'octet-stream')
    part.set_payload( open(filename,'r').read() )
    Encoders.encode_base64(part)
    part.add_header('Content-Disposition', 'attachment; filename=%s' % filename)
    msg.attach(part)
    print("find server")

    server = smtplib.SMTP('shcp10.hosting.zen.net.uk', '587')
    server.ehlo()
    server.starttls()
    server.login('submit@qualityframework.net', 'pasknowledge01')
    t = server.sendmail(msg['From'], msg['To'], msg.as_string())
    server.quit()
    note = "Mail sent"
  except:
    print ("I fail !")
    note = "Mail not sent. Err %s " % ''.join(traceback.format_exception(*sys.exc_info())[-2:]).strip().replace('\n',': ') 
    
  return(note) 

