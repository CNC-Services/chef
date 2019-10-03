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

# Install Source
cd $DOWNDIR/zabbix-$VERSION
./configure --enable-proxy --enable-agent --with-mysql --with-net-snmp --with-libcurl --with-libxml2 --with-openssl
make install

exit 0
