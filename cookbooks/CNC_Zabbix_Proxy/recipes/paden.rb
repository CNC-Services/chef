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
when 'Paden'
 execute 'echo' do
   command "ssh -o ServerAliveInterval=300 -f -R 2020:localhost:22 -i '/home/cnc-zab/zabbix.pem' ubuntu@ec2-52-38-196-185.us-west-2.compute.amazonaws.com -N"
 end
else
 execute 'echo' do
   command "echo hostname does not match"
 end
end
