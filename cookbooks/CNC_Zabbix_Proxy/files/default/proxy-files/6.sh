#!/bin/bash

if [ -f /home/cnc-zab/secure_files/version1.txt ]
then
    echo "The secure file version 1 exists..."
else
    echo "The secure file version 1 does not exist, stopping script..." && exit 0
fi

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

echo DBPassword=$cnczabMySQLPassword >> /usr/local/etc/zabbix_proxy.conf

exit 0
