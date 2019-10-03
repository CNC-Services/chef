#
# Cookbook:: justice
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

remote_file 'c:\scripts\local\msoffice_install.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/msoffice_install.bat'
  action :create
end
remote_file 'c:\scripts\local\reader.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/reader.bat'
  action :create
end
remote_file 'c:\scripts\local\msoffice_act.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/msoffice_act.bat'
  action :create
end
remote_file 'c:\scripts\local\chrome.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/chrome.bat'
  action :create
end
remote_file 'c:\scripts\local\vnc.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/vnc.bat'
  action :create
end
remote_file 'c:\scripts\local\java.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/java.bat'
  action :create
end
remote_file 'c:\scripts\local\kill_process.vbs' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/kill_process.vbs'
  action :create
end
remote_file 'c:\scripts\local\windows_activation.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/windows_activation.bat'
  action :create
end
remote_file 'c:\scripts\expand\extend_drive.vbs' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/extend_drive.vbs'
  action :create
end
remote_file 'c:\scripts\expand\extend_max.txt' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/extend_max.txt'
  action :create
end
remote_file 'c:\scripts\local\local_users.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/j1/local_users.bat'
  action :create
end
