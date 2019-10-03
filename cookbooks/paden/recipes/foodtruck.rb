#
# Cookbook:: paden
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

### Set Time Zone
# Execute local script to activate windows
batch 'x_time_zone' do
  code <<-EOH
    tzutil /s "Central Standard Time"
    EOH
end

# Create scheduled task
#windows_task 'Chef client' do
#  user 'SYSTEM'
#  command 'chef-client -L C:\chef\chef-client.log'
#  run_level :highest
#  frequency :onstart
#  frequency_modifier 30
#  action :create
#end

remote_file 'C:\scripts\soft-deploy\misc\firefox_install.exe' do
  source 'https://github.com/hydruid/cnc_chef/blob/master/cookbooks/scripts/firefox_installer.exe?raw=true'
  action :create
end
