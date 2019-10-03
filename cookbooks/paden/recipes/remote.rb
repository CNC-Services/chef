#
# Cookbook:: paden
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

remote_file 'c:\scripts\local\firefox.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/firefox.bat'
  action :create
end
remote_file 'c:\scripts\local\kill_process.vbs' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/kill_process.vbs'
  action :create
end
remote_file 'c:\scripts\local\msoffice_act.bat' do
  source 'https://raw.githubusercontent.com/hydruid/cnc_chef/master/cookbooks/scripts/msoffice_act.bat'
  action :create
end
