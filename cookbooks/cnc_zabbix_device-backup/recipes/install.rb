#
# Cookbook:: cnc_zabbix_device-backup
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Update repositories
apt_update 'update' do
  action :update
end

# Install dependencies
apt_package 'build-essential' do
  action :install
end
apt_package 'libssl-dev' do
  action :install
end
apt_package 'libffi-dev' do
  action :install
end
apt_package 'python-dev' do
  action :install
end
apt_package 'python-pip' do
  action :install
end

# Upgrade pip
execute 'pip' do
  command "pip install pip --upgrade"
end

# Install netmiko
execute 'netmiko' do
  command "pip install netmiko"
end

execute 'netmikoupgrade' do
  command "pip install netmiko --upgrade"
end

# Delete recipe activation file
  file "/home/cnc-zab/device-backup.txt" do
  action :delete
end
