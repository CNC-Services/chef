#!/bin/bash

if [ -f /home/cnc-zab/secure_files/version1.txt ]
then
    echo "The secure file version 1 exists..."
else
    echo "The secure file version 1 does not exist, stopping script..." && exit 0
fi

# Adjust Timezone
echo "America/Chicago" | sudo tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# Update OS
apt-get update

## Required Packages
apt-get install mysql-server mysql-client build-essential libmysqlclient-dev libsnmp-dev libcurl4-gnutls-dev fping nmap traceroute libxml2-dev libxml2 libpcre3-dev git -y

exit 0
