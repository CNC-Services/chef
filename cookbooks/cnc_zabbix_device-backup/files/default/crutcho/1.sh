#!/bin/bash

#Variables
TftpPath="/var/lib/tftpboot/sw"
IpPrefix="172"
TimeStamp=$(date +%Y-%m-%d_%H-%M)
ScriptPath="/home/cnc-zab/scripts/device-backup"
export $(cat /home/cnc-zab/secure_files/version1.txt | xargs)

#Remove the previous configs
rm $TftpPath/$IpPrefix*

#Run the collector script
python $ScriptPath/2.py

# Create folder with date
mkdir -p $ScriptPath/${TimeStamp}

# Copy tftp files to date we just created
cp -r $TftpPath/* $ScriptPath/${TimeStamp}

# Delete fodlers that we have backed up that are older than 30 days
find $ScriptPath -mtime +30 -type d | xargs rm -f -r

exit 0
