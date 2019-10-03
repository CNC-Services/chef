#!/bin/bash

if [ -f /home/cnc-zab/secure_files/version1.txt ]
then
    echo "The secure file version 1 exists..."
else
    echo "The secure file version 1 does not exist, stopping script..." && exit 0 
fi

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

#Mysql setup
##Drop Database
mysql -uroot -p$mySQLPassword -e "drop database zabbix_proxy;"
##Create user
mysql -u root -p$mySQLPassword -e "create user 'cnc-zab'@'localhost' identified by '$cnczabMySQLPassword';"
mysql -u root -p$mySQLPassword -e "GRANT ALL PRIVILEGES ON *.* TO 'cnc-zab'@'localhost' WITH GRANT OPTION;"
##Create database
mysql -ucnc-zab -p$cnczabMySQLPassword -e "create database zabbix_proxy character set utf8 collate utf8_bin;"

#Mysql setup alt password
##Drop Database
mysql -uroot -p$mySQLPassword2 -e "drop database zabbix_proxy;"
##Create user
mysql -u root -p$mySQLPassword2 -e "create user 'cnc-zab'@'localhost' identified by '$cnczabMySQLPassword';"
mysql -u root -p$mySQLPassword2 -e "GRANT ALL PRIVILEGES ON *.* TO 'cnc-zab'@'localhost' WITH GRANT OPTION;"
##Create database
mysql -ucnc-zab -p$cnczabMySQLPassword -e "create database zabbix_proxy character set utf8 collate utf8_bin;"

#Mysql setup alt password
##Drop Database
mysql -ucnc-zab -p$cnczabMySQLPassword -e "drop database zabbix_proxy;"
mysql -ucnc-zab -p$cnczabMySQLPassword -e "create database zabbix_proxy character set utf8 collate utf8_bin;"

exit 0
