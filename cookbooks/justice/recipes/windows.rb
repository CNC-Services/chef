#
# Cookbook:: justice
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Time Zone
batch 'x_time_zone' do
  code <<-EOH
    tzutil /s "Central Standard Time"
    EOH
end

# Time sync with NTP Server
batch 'dc_time_sync' do
  code <<-EOH
    net time \\\\%chefserver% /set /yes
    EOH
end

# Group policy update
batch 'group_policy' do
  code <<-EOH
    echo N | echo N | gpupdate /force /Wait:10
    EOH
end

# Chef Scheduled task at boot
#windows_task 'Chef client' do
#  user 'SYSTEM'
#  command 'chef-client -L C:\chef\chef-client.log'
#  run_level :highest
#  frequency :onstart
#  frequency_modifier 30
#  action :create
#end

# Chef Scheduled task every 4 hours
#windows_task 'Chef client hourly' do
#  user 'SYSTEM'
#  command 'chef-client -L C:\chef\chef-client.log'
#  run_level :highest
#  frequency :hourly
#  frequency_modifier 4
#  action :create
#end

# Create local directory for scripts
directory 'c:\scripts' do
  action :create
end
directory 'c:\scripts\local' do
  action :create
end
directory 'c:\scripts\expand' do
  action :create
end

# Download all the scripts needed to install
include_recipe "justice::remote"

# Run misc scripts for app installs and etc.
batch 'justice_local_users' do
  code <<-EOH
    c:\\scripts\\local\\local_users.bat
    EOH
end
batch 'justice_expand_disk' do
  code <<-EOH
    c:\\scripts\\expand\\extend_drive.vbs
    EOH
end
batch 'justice_chrome' do
  code <<-EOH
    c:\\scripts\\local\\chrome.bat
    EOH
end
batch 'justice_vnc' do
  code <<-EOH
    c:\\scripts\\local\\vnc.bat
    EOH
end
#Disabled as java is a security risk
#batch 'justice_java' do
#  code <<-EOH
#    c:\\scripts\\local\\java.bat
#    EOH
#end
batch 'justice_reader' do
  code <<-EOH
    c:\\scripts\\local\\reader.bat
    EOH
end
batch 'justice_windows_activation' do
  code <<-EOH
    c:\\scripts\\local\\windows_activation.bat
    EOH
end
batch 'justice_office_install' do
  code <<-EOH
    c:\\scripts\\local\\msoffice_install.bat
    EOH
end
batch 'justice_office_act' do
  code <<-EOH
    c:\\scripts\\local\\msoffice_act.bat
    EOH
end

# Close all chef windows
batch 'close_windows' do
  code <<-EOH
    c:\\scripts\\local\\kill_process.vbs
    EOH
end
