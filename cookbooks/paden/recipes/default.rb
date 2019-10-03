#
# Cookbook:: paden
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['hostname']
when 'WIN-PCPJ5EGMDGH'
 include_recipe "paden::foodtruck"
end

include_recipe "paden::windows"
