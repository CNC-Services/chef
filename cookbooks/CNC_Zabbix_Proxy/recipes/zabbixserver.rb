#
# Cookbook Name:: CNC_Zabbix_Proxy
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

### Tasks by Hostame ###
## Zabbix Backup automation
# ip-172-31-38-34
case node['hostname']
when 'ip-172-31-38-34'
 execute 'templatebackup' do
  command "sh /home/ubuntu/scripts/template_export.sh"
 end
else
 execute 'echo' do
   command "echo hostname does not match"
 end
end
