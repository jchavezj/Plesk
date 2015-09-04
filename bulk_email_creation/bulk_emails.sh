#!/bin/bash
# 
# This scripts creates the email accounts for a domain from a list

for line in $(awk '{print $1}' < email2.txt)
do
 email=`echo $line`
 PSA_PASSWORD="$(openssl rand 12 -base64)"
# 
 echo "Adding email account  $email"
 /usr/local/psa/bin/mail -c $email -passwd $PSA_PASSWORD -mailbox true; echo $email:$PSA_PASSWORD >> emails.txt
		  #/usr/local/psa/bin/mail -u $email -passwd $PSA_PASSWORD; echo $email:$PSA_PASSWORD >> emails.txt
done
