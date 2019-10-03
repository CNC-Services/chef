#!/bin/bash
##########################################
# Version: 03.10.17
#  Status: Functional
#   Notes: Stable
#  Zabbix: 3.4.4 Stable
#      OS: Ubuntu/Debian 64-Bit
##########################################

# Installer variables
ZABUSER="cnc-zab"
DOWNDIR=/home/$ZABUSER/tmp
ZABGITPATH=/home/$ZABUSER/proxy/zabbix/3.0
MYSQLUSER=cnc-zab
VERSION="3.4.4"

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

# Adjust Timezone
echo "America/Chicago" | sudo tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# Update OS
apt-get update

## Required Packages
#These need to be installed manually until they are installed correctly by a recipe
#apt-get install mysql-server mysql-client build-essential libmysqlclient-dev libsnmp-dev libcurl4-gnutls-dev fping nmap traceroute libxml2-dev libxml2

# Download Source
mkdir $DOWNDIR
wget --no-check-certificate -N https://iweb.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$VERSION/zabbix-%VERSION.tar.gz -P $DOWNDIR/
wget --no-check-certificate -N https://superb-dca2.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/%VERSION/zabbix-$VERSION.tar.gz -P $DOWNDIR/
wget --no-check-certificate -N https://superb-dca2.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.4.4/zabbix-3.4.4.tar.gz -P $DOWNDIR/
wget --no-check-certificate -N https://superb-dca2.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.4.4/zabbix-3.4.4.tar.gz -P $DOWNDIR/

tar -zxvf $DOWNDIR/zabbix-$VERSION.tar.gz
rm -fr $DOWNDIR/zabbix-*
mv zabbix-$VERSION $DOWNDIR

# Add Zabbix user
groupadd zabbix
useradd -g zabbix zabbix

# Install Source
cd $DOWNDIR/zabbix-$VERSION
./configure --enable-proxy --enable-agent --with-mysql --with-net-snmp --with-libcurl --with-libxml2 --with-openssl
make install

# MySQL Database
mysql -ucnc-zab -p$cnczabMySQLPassword zabbix_proxy < $DOWNDIR/zabbix-$VERSION/database/mysql/schema.sql
mysql -ucnc-zab -p$cnczabMySQLPassword zabbix_proxy < $DOWNDIR/zabbix-$VERSION/database/mysql/data.sql
mysql -ucnc-zab -p$cnczabMySQLPassword zabbix_proxy < $DOWNDIR/zabbix-$VERSION/database/mysql/images.sql

# Post Install Tweaks
ln -s /usr/bin/fping /usr/sbin/fping
:q
#sed -i 's/# PidFile=/PidFile=/g' /usr/local/etc/zabbix_agentd.conf

# Environment Setup
cp $ZABGITPATH/misc/cron.sh /home/$ZABUSER/
mkdir /home/$ZABUSER/scripts
cp $ZABGITPATH/misc/pps.sh /home/$ZABUSER/scripts/
#$ZABGITPATH/misc/setup_snmpd.sh

# Create init.d scripts
cp $ZABGITPATH/misc/zabbix-proxy /etc/init.d/
chmod 755 /etc/init.d/zabbix-proxy
chmod +x /etc/init.d/zabbix-proxy
chown root:root /etc/init.d/zabbix-proxy
update-rc.d zabbix-proxy defaults
update-rc.d zabbix-proxy enable

exit 0
