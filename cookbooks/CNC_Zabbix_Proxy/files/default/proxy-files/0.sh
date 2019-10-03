#!/bin/bash

#Create directory for secure file
mkdir /home/cnc-zab/secure_files
cd /home/cnc-zab/secure_files
sftp -i /home/cnc-zab/zabbix.pem -oStrictHostKeyChecking=no ubuntu@ec2-52-38-196-185.us-west-2.compute.amazonaws.com:/home/ubuntu/secure_files/version1.txt

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

#Stop the zabbix_proxy process
killall -9 zabbix_proxy
killall -9 zabbix_proxy

#Touch the init script file in case it doesn't exist
touch /etc/init.d/zabbix-proxy
exit 0
