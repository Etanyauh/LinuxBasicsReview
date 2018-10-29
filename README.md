### Check your email w/o a web browser!
##  By:Joseph Huaynate

# Summary 
###Gmail is what I use to check my email but sometimes there is too much clutter and I just wish to check who is sending me what and what exactly do they want. And thanks to RSS feeds, we can parse the RSS feed with the sender's name and the email's subject. Although this is just the intial step, I do want to be able to read the email and as well as respond to the sender. 

### Prerequisites
- Have your username and password* for gmail at hand because you will need them.
	   *(If your Gmail account has two factor authentication active then you will need to get an App Password throught this link: https://support.google.com/accounts/answer/185833?hl=en
Next you will go to How to generate an App password. Once created, this will be your password for your Gmail account)
	
- Have curl installed. curl command is a tool to download or tranfser files/data from or to a server using FTP, HTTP, HTTPS, SCP, SFTP, SMB and other supported protocols on Linux or Unix-like
system. 
  If curl is NOT installed: sudo apt install curl

- Understanding of sed command: SED command in UNIX stands for 'stream editor' and it can perform many functions on a file, such as, search, find, replace, insert, deletion. With SED you can edit files even without opening it. It also supports regular expressions, which allows for complex pattern matching. 
   SYNTAX: sed OPTIONS.... [SCRIPT][INPUTFILE...]

-Understanding of regular expressions (RegEx). A link to explain: https://medium.com/factory-mind/regex-tutorial-a-simple-cheatsheet-by-examples-649dc1c3f285 
 

### Como trabaja
- tr -d '\n' removes the newline character, so that we can recreate each email entry with \n as the delimiter

-sed 's:</entry>:\n:g' replaces every </entry> element with a newline, so that each e-mail entry is delimited by a new line, so emails can be parsed one-by-one. This can be seens through the source file of https://mail.google.com/mail/feed/atom. <entry> TAGS </entry> correspond to a single mail entry 

- sed 's/.*<title>\(.*\)<\title.*<author><name>\([^<\*\)<\/........ This block matches the substring title by using <title>\(.*\)<\/title, the sender name by using <author><name>\[^<]*\/</name>, and the email bu using <email>\([^<]*\).

- Author: \2 [\3] \nSUbject: \1\n : THis allows for an easy to read format, where \2 corresponds to the second substrin match. SHOW_COUNT variable is an input parameter which the user can add in order to selected how many unread email the user wants to be printed. 
## Author
  Joseph Huaynate

