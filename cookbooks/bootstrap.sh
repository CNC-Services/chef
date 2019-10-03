#!/bin/bash

os=$1
user=$2
pass=$3
ip=$4
name=$5
recipe=$6


#Echo Syntax
echo "" && echo "### Syntax" && echo "./bootstrap.sh OS 'Domain\Username' 'Password' IP-Address Node-Name RecipeAssignment" && echo "" && echo ""

#Check to ensure variables aren't empty
if [ -z "$os" ]
then
   echo "The OS variable is blank." && exit 0
elif [ -z "$user" ]
then
   echo "The username variable is blank." && exit 0
elif [ -z "$pass" ]
then
   echo "The password variable is blank." && exit 0
elif [ -z "$ip" ]
then
   echo "The IP-Address variable is blank." && exit 0
elif [ -z "$name" ]
then
   echo "The Node-Name variable is blank." && exit 0
fi

#Bootstrap the client
if [ "$os" == "windows" ]; then
   echo "Starting bootstrap..."
   knife bootstrap windows winrm $ip -x $user -P $pass --node-name $name --bootstrap-version 12.8
fi
if [ "$os" == "linux" ]; then
   echo "Starting bootstrap..."
   knife bootstrap $ip -x $user -P $pass --ssh-port 22 --sudo --node-name $name
fi
if [ "$os" == "debian" ]; then
   echo "Starting bootstrap..."
   knife bootstrap $ip -x $user -P $pass --ssh-port 22 --node-name $name
fi


#Assign Recipes
if [ "$os" == "windows" ]; then
   echo "OS matches, checking recipe assignments"
   if [ "$recipe" == "purcell" ]; then
      echo "Recipe assignment matches, assigning recipes.."
      knife node run_list add $name recipe[purcell_windows_generic]
      knife node run_list add $name recipe[purcell_windows_apps]
   fi
   if [ "$recipe" == "paden" ]; then
      echo "Recipe assignment matches, assigning recipes.."
      knife node run_list add $name recipe[windows]
      knife node run_list add $name recipe[paden]
   fi
   if [ "$recipe" == "justice" ]; then
      echo "Recipe assignment matches, assigning recipes.."
      knife node run_list add $name recipe[windows]
      knife node run_list add $name recipe[justice]
   fi
fi
if [ "$os" == "linux" ]; then
   echo "OS matches, checking recipe assignments"
   if [ "$recipe" == "proxy" ]; then
      echo "Recipe assignment matches, assigning recipes.."
      knife node run_list add $name recipe[cron-delvalidate]
      knife node run_list add $name recipe[CNC_Zabbix_Proxy]
   fi
fi

exit 0
