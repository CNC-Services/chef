#
# Cookbook:: purcell_windows_generic
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

### Sync local scripts from DC
# Create scripts folder
directory 'c:\scripts' do
  action :create
end
directory 'c:\scripts\local' do
  action :create
end
# Copy the scripts
#batch 'copy_scripts' do
#  code <<-EOH
#    copy /Y \\\\purcell2k1\\soft-deploy$\\chef\\* c:\\scripts\\local
#    EOH
#end

### Expand drive C
# Execute local script to activate windows
#batch 'x_expand_disk' do
#  code <<-EOH
#    \\\\purcell2k1\\soft-deploy$\\chef\\expand_disk.bat
#    EOH
#end

### Configure local users
#batch 'x_local_users' do
#  code <<-EOH
#    net user /delete cnc
#    net user /delete admin
#    net user /add techuser Dr@gon14
#    net localgroup administrators techuser /add
#    EOH
#end

### Close CMD Windows
# Execute local script to activate windows
batch 'kill_cmd' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\scheduled_task\\kill_process.vbs
    EOH
end
