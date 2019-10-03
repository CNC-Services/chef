#!/bin/bash

#Create directory for secure file
mkdir /home/cnc-zab/secure_files
cd /home/cnc-zab/secure_files
sftp -i /home/cnc-zab/zabbix.pem -oStrictHostKeyChecking=no ubuntu@ec2-52-38-196-185.us-west-2.compute.amazonaws.com:/home/ubuntu/secure_files/version1.txt

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

#Remove the previous configs
rm /srv/tftp/purcell/172*

#Run the collector script
echo "Run the collector script..."
python /home/cnc-zab/scripts/purcell_collect.py

#Run the firmware upgrade script
DOW=$(date +%u)
######J9625A - Tuesdays#####################
#if [ $DOW == 2 ]
#then
#   python /home/cnc-zab/scripts/purcell_upgrade_J9625A.py
#fi
######J9627A - Wednesdays#####################
#if [ $DOW == 3 ]
#then
#   python /home/cnc-zab/scripts/purcell_upgrade_J9627A.py
#fi
############################################
######J9729A - Thursday#####################
#if [ $DOW == 4 ]
#then
#   python /home/cnc-zab/scripts/purcell_upgrade_J9729A.py
#fi
############################################

exit 0
