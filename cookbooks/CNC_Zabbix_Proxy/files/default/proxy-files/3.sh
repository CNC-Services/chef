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

# Download Source
mkdir $DOWNDIR
rm -fr $DOWNDIR/*
wget --no-check-certificate -N https://iweb.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$VERSION/zabbix-$VERSION.tar.gz -P $DOWNDIR/
wget --no-check-certificate -N https://superb-dca2.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$VERSION/zabbix-$VERSION.tar.gz -P $DOWNDIR/
wget --no-check-certificate -N https://superb-dca2.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$VERSION/zabbix-$VERSION.tar.gz -P $DOWNDIR/
wget --no-check-certificate -N https://superb-dca2.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$VERSION/zabbix-$VERSION.tar.gz -P $DOWNDIR/

tar -zxvf $DOWNDIR/zabbix-$VERSION.tar.gz -C $DOWNDIR
#rm -fr $DOWNDIR/zabbix-*
#mv zabbix-$VERSION $DOWNDIR

# Add Zabbix user
groupadd zabbix
useradd -g zabbix zabbix

exit 0
