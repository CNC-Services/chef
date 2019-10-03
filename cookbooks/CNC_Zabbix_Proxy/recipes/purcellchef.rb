#
# Cookbook Name:: CNC_Zabbix_Proxy
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

### Tasks by Hostname ###
## auto join chef
# mount cifs and update list
cookbook_file "/home/cnc-zab/chef-repo/cookbooks/mount.sh" do
  source "purcell/mount.sh"
end
# bootstrap from list
cookbook_file "/home/cnc-zab/chef-repo/cookbooks/chef_auto.sh" do
  source "purcell/chef_auto.sh"
end
# crons to run cifs and bootstrap scripts
cron "purcellmount" do
  minute '15'
  hour '*/2'
  command "cd /home/cnc-zab/chef-repo/cookbooks/ && sh mount.sh"
  action :create
end
cron "purcellbootstrap" do
  minute '25'
  hour '*/2'
  command "cd /home/cnc-zab/chef-repo/cookbooks/ && sh chef_auto.sh"
  action :create
  user 'cnc-zab'
end
