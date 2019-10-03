#
# Cookbook Name:: cron-delvalidate
# Recipe:: Chef-Client Cron & Delete Validation.pem 
#
#

ruby_block 'cronall' do
  block do
    run_context.include_recipe 'cron-delvalidate::all'
  end
  not_if { ::File.exist?("/Users/cncadmin/scripts/box/zabbix_backup.txt") }
end

ruby_block 'treymacbook' do
  block do
    run_context.include_recipe 'cron-delvalidate::macbook'
  end
  only_if { ::File.exist?("/Users/cncadmin/scripts/box/zabbix_backup.txt") }
end
