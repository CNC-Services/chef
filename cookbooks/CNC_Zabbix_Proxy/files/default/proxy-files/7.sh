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
ZABGITPATH=/home/$ZABUSER/proxy/zabbix/3.0
MYSQLUSER=cnc-zab
VERSION="3.4.4"

#Import variables from secure file
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

# Post Install Tweaks
ln -s /usr/bin/fping /usr/sbin/fping
:q
#sed -i 's/# PidFile=/PidFile=/g' /usr/local/etc/zabbix_agentd.conf

# Environment Setup
cd /home/$ZABUSER/proxy
git clone https://github.com/hydruid/zabbix.git

cp $ZABGITPATH/misc/cron.sh /home/$ZABUSER/
mkdir /home/$ZABUSER/scripts
cp $ZABGITPATH/misc/pps.sh /home/$ZABUSER/scripts/
#$ZABGITPATH/misc/setup_snmpd.sh
cp /home/$ZABUSER/proxy/snmpd.conf /etc/snmp/

# Create init.d scripts
cp $ZABGITPATH/misc/zabbix-proxy /etc/init.d/
chmod 755 /etc/init.d/zabbix-proxy
chmod +x /etc/init.d/zabbix-proxy
chown root:root /etc/init.d/zabbix-proxy
update-rc.d zabbix-proxy defaults
update-rc.d zabbix-proxy enable

# Start zabbix proxy
/etc/init.d/zabbix-proxy stop
/etc/init.d/zabbix-proxy start

# Restart snmp
/etc/init.d/snmpd stop
/etc/init.d/snmpd start

# Delete proxy start script
rm -f /home/cnc-zab/proxy.txt

# Stop script
exit 0
