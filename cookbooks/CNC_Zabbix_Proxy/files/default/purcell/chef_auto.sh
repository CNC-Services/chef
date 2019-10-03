#! /bin/bash

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

#Variables
logon='administrator'
password=$purcelldomainadminpass
site=purcell
domain=purcellps

cat "/home/cnc-zab/chef-repo/cookbooks/list2.txt" | while read LINE3
do
echo $LINE3
./bootstrap.sh windows $domain\\$logon $password $LINE3 purcell_windows_$LINE3 $site
done

exit 0
