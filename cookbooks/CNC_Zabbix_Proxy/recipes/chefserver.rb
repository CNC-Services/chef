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
execute 'hostinfoandexportbackup' do
 command "cd /home/ubuntu/scripts && sh host_info.sh"
end

# Create crons
cron "clientrun" do
  minute '*/30'
  command "/home/ubuntu/scripts/zabbix-gnomes/zhostfinder.py -A -n > /home/ubuntu/scripts/id.txt"
  action :create
  user 'ubuntu'
end

# Create crons
cron "templatebackup" do
  minute '*/45'
  command "sh /home/ubuntu/zabbix/API/script_backup_templates.sh /home/ubuntu/zabbix/API/"
  action :create
  user 'ubuntu'
end

# Create crons
cron "hostbackup" do
  minute '*/45'
  command "sh /home/ubuntu/zabbix/API/script_backup_hosts.sh /home/ubuntu/zabbix/API/"
  action :create
  user 'ubuntu'
end
