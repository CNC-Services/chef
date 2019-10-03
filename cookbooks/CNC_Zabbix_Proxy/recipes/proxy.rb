#
# Cookbook Name:: CNC_Zabbix_Proxy
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
### Requirements ###
# MySQL Server needs to be installed before running this recipe

##Step 1 - Delete old files
file "/home/cnc-zab/cron.sh" do
  action :delete
end
file "/home/cnc-zab/0.sh" do
  action :delete
end
file "/home/cnc-zab/1.sh" do
  action :delete
end
file "/home/cnc-zab/2.sh" do
  action :delete
end
file "/home/cnc-zab/proxy.sh" do
  action :delete
end
file "/usr/local/etc/zabbix_proxy.conf" do
  action :delete
  only_if {File.exists?("/home/cnc-zab/proxy.txt")}
end
directory "/home/cnc-zab/proxy" do
  recursive true
  action :delete
end

##Step 2 - Push files 
directory "/home/cnc-zab/proxy" do
  action :create
end
cookbook_file "/home/cnc-zab/proxy-files.tar.gz" do
  source "proxy-files.tar.gz"
end
execute 'extract_tar' do
  command "cd /home/cnc-zab && tar zxvf proxy-files.tar.gz -C proxy"
end
file "/home/cnc-zab/proxy-files.tar.gz" do
  action :delete
end
cookbook_file "/usr/local/etc/zabbix_proxy.conf" do
  source "proxy-files/zabbix_proxy.conf"
end

##Step 3 - Stop Zabbix and download secure files
execute '0.sh' do
  command "/bin/sh /home/cnc-zab/proxy/0.sh > /home/cnc-zab/proxy/0.log 2>&1"
end

##Step 4 - Drop database and create new
execute '1.sh' do
  command "/bin/sh /home/cnc-zab/proxy/1.sh > /home/cnc-zab/proxy/1.log 2>&1"
end

##Step 5 - Update OS and install packages
execute '2.sh' do
  command "/bin/sh /home/cnc-zab/proxy/2.sh > /home/cnc-zab/proxy/2.log 2>&1"
end

##Step 6 - Download zabbix source
execute '3.sh' do
  command "/bin/sh /home/cnc-zab/proxy/3.sh > /home/cnc-zab/proxy/3.log 2>&1"
end

##Step 7 - Install source
execute '4.sh' do
  command "/bin/sh /home/cnc-zab/proxy/4.sh > /home/cnc-zab/proxy/4.log 2>&1"
end

##Step 8 - Import zabbix database
execute '5.sh' do
  command "/bin/sh /home/cnc-zab/proxy/5.sh > /home/cnc-zab/proxy/5.log 2>&1"
end

##Step 9 - Zabbix Proxy config file
execute '6.sh' do
  command "/bin/sh /home/cnc-zab/proxy/6.sh > /home/cnc-zab/proxy/6.log 2>&1"
end

##Step 10 - Post Install cleanup
execute '7.sh' do
  command "/bin/sh /home/cnc-zab/proxy/7.sh > /home/cnc-zab/proxy/7.log 2>&1"
end
