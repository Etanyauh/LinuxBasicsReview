#!/bin/bash
#Desc: Fetch gmail tool 

username='jahuay93'
password='pfamnwqvlodjvakp'

# Below is an input parameter. When executing it, you can select how many unread emails 
# you want to see
SHOW_COUNT=$1 #Number of recent unread mails to be shown 

echo

curl -u $username:$password --silent "https://mail.google.com/mail/feed/atom"| \
tr -d '\n' | sed 's:</entry>:\n:g' |\
sed -n 's/.*<title>\(.*\)<\/title.*<author><name>\([^<]*\)<\/name><email>\([^<]*\).*/From: \2 [\3] \nSubject: \1\n/p' | \
head -n $(($SHOW_COUNT * 3))
