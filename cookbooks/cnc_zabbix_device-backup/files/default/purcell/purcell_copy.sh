#!/bin/bash

# Variables
time_stamp=$(date +%Y-%m-%d_%H-%M)

# Create folder with date
mkdir -p /home/cnc-zab/scripts/device-backup/${time_stamp}

# Pull the juniper SRX config over SCP
scp "root@172.16.1.1:/config/juniper.conf.gz" "/srv/tftp/purcell/172.16.1.1_juniper.conf.gz"

# Copy tftp files to date we just created
cp -r /srv/tftp/purcell/* /home/cnc-zab/scripts/device-backup/${time_stamp}

# Delete fodlers that we have backed up that are older than 30 days
find /home/cnc-zab/scripts/device-backup -mtime +30 -type d | xargs rm -f -r

exit 0
