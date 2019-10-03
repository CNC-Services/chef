#
# Cookbook Name:: CNC_Zabbix_Proxy
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# SSH Backdoor
case node['hostname']
when 'Justice'
 execute 'echo' do
	 command "ssh -o ServerAliveInterval=300 -f -R 1616:localhost:22 -R 2929:172.16.1.62:3389 -i '/home/cnc-zab/zabbix.pem' ubuntu@ec2-52-38-196-185.us-west-2.compute.amazonaws.com -N"
 end
else
 execute 'echo' do
   command "echo hostname does not match"
 end
end

### Tasks by Hostname ###
## auto join chef
# mount cifs and update list
#cookbook_file "/home/cnc-zab/chef-repo/cookbooks/mount.sh" do
#  source "mount.sh"
#  not_if {File.exists?("/home/cnc-zab/chef-repo/cookbooks/mount.sh")}
#end
# bootstrap from list
#cookbook_file "/home/cnc-zab/chef-repo/cookbooks/chef_auto.sh" do
#  source "chef_auto.sh"
#  not_if {File.exists?("/home/cnc-zab/chef-repo/cookbooks/chef_auto.sh")}
#end
# crons to run cifs and bootstrap scripts
#cron "justicemount" do
#  minute '15'
#  hour '*/2'
#  command "cd /home/cnc-zab/chef-repo/cookbooks/ && sh mount.sh"
#  action :create
#end
#cron "justicebootstrap" do
#  minute '25'
#  hour '*/2'
#  command "cd /home/cnc-zab/chef-repo/cookbooks/ && sh chef_auto.sh"
#  action :create
#  user 'cnc-zab'
#end
