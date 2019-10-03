#!/bin/bash

#Variables
site=$1
command=$2

#Check to ensure variables aren't empty
if [ -z "$site" ]
then
   echo "The site variable is blank."
   echo "" && echo "### Syntax" && echo "./audit.sh site command (list status details push)" && echo "" && exit 0
elif [ -z "$command" ]
then
   echo "The command variable is blank." && echo ""
   echo "" && echo "### Syntax" && echo "./audit.sh site command (list status details push)" && echo "" && exit 0
fi

#List - Basic list of nodes
if [ "$command" == "list" ]; then
   knife node list | grep $site
fi

#Status - Date of last communication with chef
if [ "$command" == "status" ]; then
   knife status | grep $site
fi

#Details - Node info and run_lists
if [ "$command" == "details" ]; then
   filename='reports/node_list.txt'
   filename2='reports/node_run_list.txt'
   knife node list | grep $site > $filename
   while read p; do
        knife node show $p >> $filename2
   done < $filename
   cat $filename2
   rm -fr $filename && rm -fr $filename2
fi

#Push - Assign recipes to nodes
if [ "$command" == "push" ]; then
   echo "This option disabled for now...."
fi

#Stop Script
exit 0

###LEGACY###
#Push recipes to node run_list
if [ "$command" == "push" ]; then
   echo "Pushing node run_list...."
   if [ "$site" == "purcell" ]; then
      filename='reports/node_list.txt'
      echo Start
      while read p; do
           knife node run_list add $p recipe[purcell_windows_generic]
           knife node run_list add $p recipe[purcell_windows_apps]
      done < $filename
   fi
   if [ "$site" == "paden" ]; then
      filename='reports/node_list.txt'
      echo Start
      while read p; do
           knife node run_list remove $p recipe[paden_windows_generic]
           knife node run_list remove $p recipe[paden_windows_apps]
           knife node run_list add $p recipe[windows]
           knife node run_list add $p recipe[paden]
      done < $filename
   fi
   if [ "$site" == "justice" ]; then
      filename='reports/node_list.txt'
      echo Start
      while read p; do
           knife node run_list remove $p recipe[justice_windows_generic]
           knife node run_list remove $p recipe[justice_windows_apps]
           knife node run_list add $p recipe[windows]
           knife node run_list add $p recipe[justice]
      done < $filename
   fi
fi

exit 0
