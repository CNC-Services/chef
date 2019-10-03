#
# Cookbook:: paden_windows_apps
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

### Install Microsoft Security Essentials
batch 'mse' do
  code <<-EOH
    c:\\scripts\\local\\mse.bat
    EOH
end

### Install Google Chrome
batch 'chrome' do
  code <<-EOH
    c:\\scripts\\local\\chrome.bat
    EOH
end

### Install Java
batch 'java' do
  code <<-EOH
    c:\\scripts\\local\\java.bat
    EOH
end

### Install Adobe Reader
batch 'reader' do
  code <<-EOH
    c:\\scripts\\local\\reader.bat
    EOH
end

### Install Adobe Reader
batch 'office' do
  code <<-EOH
    c:\\scripts\\local\\office.bat
    EOH
end
