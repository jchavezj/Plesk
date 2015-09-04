#!/bin/bash
#
# This script creates multiple domains in Plesk along with the ftp user for the domain.
# need to add the ip where the domain will be hosted on.

for line in $(awk '{print $1}' < domains1.txt)
do
 client='client_login_name'
 domain=`echo $line`
 ftpuser=`echo $line | cut -c 1-16`
 ftppass="$(openssl rand 12 -base64)"
 shell='/usr/local/psa/bin/chrootsh'
 ipaddr='insert ip here'
 hosting='true'
 fpauth='true'
 echo "Adding domain $domain"
 /usr/local/psa/bin/domain -c $domain -status enabled -ip $ipaddr -hosting $hosting -login $ftpuser -passwd $ftppass -shell $shell -fpauth $fpauth -fplogin $ftpuser -fppasswd $ftppass
done
