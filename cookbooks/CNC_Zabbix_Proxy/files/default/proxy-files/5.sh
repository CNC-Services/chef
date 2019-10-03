#!/bin/bash

if [ -f /home/cnc-zab/secure_files/version1.txt ]
then
    echo "The secure file version 1 exists..."
else
    echo "The secure file version 1 does not exist, stopping script..." && exit 0
fi

# Installer variables
ZABUSER="cnc-zab"
DOWNDIR=/home/$ZABUSER/tmp
VERSION="3.4.4"

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

# MySQL Database
mysql -ucnc-zab -p$cnczabMySQLPassword zabbix_proxy < $DOWNDIR/zabbix-$VERSION/database/mysql/schema.sql
mysql -ucnc-zab -p$cnczabMySQLPassword zabbix_proxy < $DOWNDIR/zabbix-$VERSION/database/mysql/data.sql
mysql -ucnc-zab -p$cnczabMySQLPassword zabbix_proxy < $DOWNDIR/zabbix-$VERSION/database/mysql/images.sql

exit 0
