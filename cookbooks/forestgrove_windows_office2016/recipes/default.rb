#
# Cookbook Name:: forestgrove_windows_office2016
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

### Install Microsoft Office 2016
batch 'office2016' do
  code <<-EOH
    c:\\scripts\\local\\office2016.bat
    EOH
end
