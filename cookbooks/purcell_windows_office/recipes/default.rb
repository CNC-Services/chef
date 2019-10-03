#
# Cookbook:: purcell_windows_office
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

### Install Microsoft Office
batch 'office' do
  code <<-EOH
    c:\\scripts\\local\\office.bat
    EOH
end
