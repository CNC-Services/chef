#! /bin/bash

#Variables
server=$purcelladserver
password=$purcelldomainadminpass

#Create directory for secure file
mkdir /home/cnc-zab/secure_files
cd /home/cnc-zab/secure_files
sftp -i /home/cnc-zab/zabbix.pem -oStrictHostKeyChecking=no ubuntu@ec2-52-38-196-185.us-west-2.compute.amazonaws.com:/home/ubuntu/secure_files/version1.txt

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

mkdir /home/cnc-zab/cifs
umount /home/cnc-zab/cifs
mount -t cifs //$server/c$ /home/cnc-zab/cifs -o username=administrator,password=$password

cp /home/cnc-zab/cifs/scripts/AD/list2.txt /home/cnc-zab/chef-repo/cookbooks/
dos2unix list2.txt

exit 0
