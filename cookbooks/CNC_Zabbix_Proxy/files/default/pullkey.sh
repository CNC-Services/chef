#!/bin/bash
#Create directory for secure file
cd /home/cnc-zab
sftp -i /home/cnc-zab/zabbix.pem -oStrictHostKeyChecking=no ubuntu@ec2-52-38-196-185.us-west-2.compute.amazonaws.com:/home/ubuntu/secure_files/Example.pem
