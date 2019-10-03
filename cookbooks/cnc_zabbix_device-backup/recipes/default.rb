#
# Cookbook:: cnc_zabbix_device-backup
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "cnc_zabbix_device-backup::crutcho"
include_recipe "cnc_zabbix_device-backup::purcell"

ruby_block 'install' do
  block do
    run_context.include_recipe 'cnc_zabbix_device-backup::install'
  end
  only_if { ::File.exist?("/home/cnc-zab/device-backup.txt") }
end
