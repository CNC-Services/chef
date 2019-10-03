#
# Cookbook:: paden_windows_generic
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

### Activate Windows
# Execute local script to activate windows
batch 'x_windows_activation' do
  code <<-EOH
    robocopy "\\\\paden-dns\\soft-deploy$\\scripts" "c:\\scripts\\local" /MIR
    c:\\scripts\\local\\windows_activation.bat
    EOH
end

### Expand drive C
# Execute local script to activate windows
batch 'x_expand_disk' do
  code <<-EOH
    c:\\scripts\\local\\expand_disk.bat
    EOH
end

### Set Time Zone
# Execute local script to activate windows
batch 'x_time_zone' do
  code <<-EOH
    tzutil /s "Central Standard Time" 
    EOH
end

### Close CMD Windows
# Execute local script to activate windows
batch 'kill_cmd' do
  code <<-EOH
    c:\\scripts\\local\\scheduled_task\\kill_process.vbs
    EOH
end
