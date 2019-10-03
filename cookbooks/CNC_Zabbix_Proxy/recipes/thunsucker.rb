#
# Cookbook Name:: CNC_Zabbix_Proxy
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

### Tasks by Hostame ###
## Copy Zabbix Backups into Box
execute 'bootstrap' do
 command "cd /Users/cncadmin/scripts/box && sh backup.sh"
end
