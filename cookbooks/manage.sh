#!/bin/bash

#Variables
command=$1
chefnode=$2

#Echo Syntax
echo "" && echo "### Syntax" && echo "./manage.sh command (delete or status) host or group" && echo ""

#Check to ensure variables aren't empty
if [ -z "$command" ]
then
   echo "The command variable is blank." && exit 0
elif [ -z "$chefnode" ]
then
   echo "The node variable is blank." && exit 0
fi

#Delete old node
if [ "$command" == "delete" ]; then
   echo "Delete old node: $chefnode"
   knife node delete $chefnode
   knife client delete $chefnode
fi

#Delete old node
if [ "$command" == "status" ]; then
   echo "Last check in for: $chefnode"
   knife status | grep $chefnode
fi


exit 0
