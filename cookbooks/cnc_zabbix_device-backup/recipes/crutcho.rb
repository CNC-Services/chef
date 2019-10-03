#
# Cookbook:: cnc_zabbix_device-backup
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['hostname']
when 'Crutcho'
   #Create required redirectories
   directory '/home/cnc-zab/scripts/' do
     action :create
   end
   directory '/home/cnc-zab/scripts/device-backup/' do
     action :create
   end
  #Download required files 
  cookbook_file "/home/cnc-zab/scripts/device-backup/1.sh" do
    source "crutcho/1.sh"
  end
  cookbook_file "/home/cnc-zab/scripts/device-backup/2.py" do
    source "crutcho/2.py"
  end
  cookbook_file "/home/cnc-zab/scripts/device-backup/list.txt" do
    source "crutcho/list.txt"
  end
  cookbook_file "/home/cnc-zab/scripts/device-backup/list2.txt" do
    source "crutcho/list2.txt"
  end
  cookbook_file "/home/cnc-zab/scripts/tar_device-backup.sh" do
    source "crutcho/tar_device-backup.sh"
  end
  #Execute the collection script
  execute 'collect' do
    command "sh /home/cnc-zab/scripts/device-backup/1.sh"
  end
else
 execute 'echocrutcho' do
   command "echo hostname does not match"
 end
end
