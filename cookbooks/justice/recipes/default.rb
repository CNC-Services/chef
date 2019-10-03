#
# Cookbook:: justice
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['hostname']
when 'vmdc02'
 include_recipe "justice::foodtruck"
end

include_recipe "justice::windows"
