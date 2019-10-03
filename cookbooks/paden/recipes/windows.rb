#
# Cookbook:: paden
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

### Set Time Zone
batch 'x_time_zone' do
  code <<-EOH
    tzutil /s "Central Standard Time"
    EOH
end

# Group policy update
batch 'group_policy' do
  code <<-EOH
    echo N | echo N | gpupdate /force /Wait:10
    EOH
end

# Create scheduled task at boot
windows_task 'Chef client' do
  user 'SYSTEM'
  command 'chef-client -L C:\chef\chef-client.log'
  run_level :highest
  frequency :onstart
  frequency_modifier 30
  action :create
end

# Create scheduled task every 4 hours
windows_task 'Chef client hourly' do
  user 'SYSTEM'
  command 'chef-client -L C:\chef\chef-client.log'
  run_level :highest
  frequency :hourly
  frequency_modifier 4
  action :create
end

# Create local directory for scripts
directory 'c:\scripts' do
  action :create
end
directory 'c:\scripts\local' do
  action :create
end

# Download all the scripts needed to install
include_recipe "paden::remote"

# Run misc scripts for app installs and etc.
batch 'firefox' do
  code <<-EOH
    c:\\scripts\\local\\firefox.bat  # Install Firefox
    EOH
end
batch 'msoffice_act' do
  code <<-EOH
    c:\\scripts\\local\\msoffice_act.bat  # Active Microsoft Office
    EOH
end
# Close all chef windows
batch 'close_windows' do
  code <<-EOH
    c:\\scripts\\local\\kill_process.vbs
    EOH
end
