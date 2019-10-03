#
# Cookbook Name:: justice_windows_generic
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Resync group policy
batch 'group_policy' do
  code <<-EOH
    gupdate /force
    EOH
end

# Sync time with the new DC
batch 'dc_time_sync' do
  code <<-EOH
    net time \\\\vmdc02 /set /yes
    EOH
end

#### Activate Windows
## Execute local script to activate windows
#batch 'justice_windows_activation' do
#  code <<-EOH
#    robocopy "\\\\vmdc01\\soft-deploy$\\scripts" "c:\\scripts\\local" /MIR
#    c:\\scripts\\local\\justice_windows_activation.bat
#    EOH
#end
#
#### Expand drive C 
## Execute local script to activate windows
#batch 'justice_expand_disk' do
#  code <<-EOH
#    c:\\scripts\\local\\justice_expand_disk.bat
#    EOH
#end
#
#### Install Tight VNC
## Execute local script to activate windows
#batch 'justice_tight_vnc' do
#  code <<-EOH
#    c:\\scripts\\local\\justice_tight_vnc.bat
#    EOH
#end
#
#### Close CMD Windows
## Execute local script to activate windows
#batch 'kill_cmd' do
#  code <<-EOH
#    c:\\scripts\\local\\scheduled_task\\kill_process.vbs
#    EOH
#end
