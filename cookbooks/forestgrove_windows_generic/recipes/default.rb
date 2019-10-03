#
# Cookbook Name:: forestgrove_windows_generic
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

### Copy the soft-deploy scripts
batch 'soft-deploy' do
  code <<-EOH
    robocopy "\\\\fgs1dhcpdns\\soft-deploy$\\scripts" "c:\\scripts\\local" /MIR
    EOH
end
