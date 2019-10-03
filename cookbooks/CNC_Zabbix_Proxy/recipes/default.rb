#
# Cookbook Name:: CNC_Zabbix_Proxy
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/home/cnc-zab/scripts/pullkey.sh' do
  source 'pullkey.sh'
  mode '0644'
end

execute 'pullkey.sh' do
  command "/bin/sh /home/cnc-zab/scripts/pullkey.sh"
end

ruby_block 'proxyrun' do
  block do
    run_context.include_recipe 'CNC_Zabbix_Proxy::proxy'
  end
  only_if { ::File.exist?("/home/cnc-zab/proxy.txt") }
end

ruby_block 'zabbixbackuptobox' do
  block do
    run_context.include_recipe 'CNC_Zabbix_Proxy::thunsucker'
  end
  only_if { ::File.exist?("/Users/cncadmin/scripts/box/zabbix_backup.txt") }
end

case node['hostname']
when 'ip-172-31-38-34'
 include_recipe "CNC_Zabbix_Proxy::zabbixserver"
else
 execute 'echoZabbix' do
   command "echo hostname does not match zabbix server"
 end
end

ruby_block 'zabbixbackup' do
  block do
    run_context.include_recipe 'CNC_Zabbix_Proxy::chefserver'
  end
  only_if { ::File.exist?("/home/ubuntu/scripts/chef_server_confirmed.txt") }
end

case node['hostname']
when 'Achille'
 include_recipe "CNC_Zabbix_Proxy::achille"
else
 execute 'echoAchille' do
   command "echo hostname does not match Achille"
 end
end

case node['hostname']
when 'DeborahBrown'
 include_recipe "CNC_Zabbix_Proxy::deborahbrown"
else
 execute 'echoDeborahBrown' do
   command "echo hostname does not match DeborahBrown"
 end
end

case node['hostname']
when 'Carney'
 include_recipe "CNC_Zabbix_Proxy::carney"
else
 execute 'echoCarney' do
   command "echo hostname does not match Carney"
 end
end

case node['hostname']
when 'CNC'
 include_recipe "CNC_Zabbix_Proxy::cnc"
else
 execute 'echoCNC' do
   command "echo hostname does not match CNC"
 end
end

case node['hostname']
when 'Crutcho'
 include_recipe "CNC_Zabbix_Proxy::crutcho"
else
 execute 'echoCrutcho' do
   command "echo hostname does not match Crutcho"
 end
end

case node['hostname']
when 'Justice'
 include_recipe "CNC_Zabbix_Proxy::justice"
else
 execute 'echoJustice' do
   command "echo hostname does not match justice"
 end
end

case node['hostname']
when 'LittleAxe'
 include_recipe "CNC_Zabbix_Proxy::littleaxe"
else
 execute 'echoLittleAxe' do
   command "echo hostname does not match littleaxe"
 end
end

case node['hostname']
when 'Paden'
 include_recipe "CNC_Zabbix_Proxy::paden"
else
 execute 'echoPaden' do
   command "echo hostname does not match Paden"
 end
end

case node['hostname']
when 'PleasGrove'
 include_recipe "CNC_Zabbix_Proxy::pleasgrove"
else
 execute 'echoPleasGrove' do
   command "echo hostname does not match PleasGrove"
 end
end

case node['hostname']
when 'Purcell'
 include_recipe "CNC_Zabbix_Proxy::purcell"
else
 execute 'echoPurcell' do
   command "echo hostname does not match Purcell"
 end
end

case node['hostname']
when 'purcellchef'
 include_recipe "CNC_Zabbix_Proxy::purcellchef"
else
 execute 'echoPurcellchef' do
   command "echo hostname does not match purcellchef"
 end
end

case node['hostname']
when 'Sankofa'
 include_recipe "CNC_Zabbix_Proxy::sankofa"
else
 execute 'echoSankofa' do
   command "echo hostname does not match Sankofa"
 end
end

case node['hostname']
when 'Shawnee'
 include_recipe "CNC_Zabbix_Proxy::shawnee"
else
 execute 'echoShawnee' do
   command "echo hostname does not match Shawnee"
 end
end

case node['hostname']
when 'Wewoka'
 include_recipe "CNC_Zabbix_Proxy::wewoka"
else
 execute 'echoWewoka' do
   command "echo hostname does not match Wewoka"
 end
end

