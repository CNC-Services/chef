#
# Cookbook:: purcell_windows_apps
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

### Install LightSpeed Relay Agent
batch 'relayagent' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\relayagent.bat
    EOH
end

### Install Microsoft Security Essentials
batch 'mse' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\mse.bat
    EOH
end

### Install SmartNotebook Drivers 
batch 'smartdrivers' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\smartdrivers.bat
    EOH
end

### Install Adobe Air
batch 'air' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\air.bat
    EOH
end

### Install Google Chrome
batch 'chrome' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\chrome.bat
    EOH
end

### Install Smart Notebook
#batch 'smart' do
#  code <<-EOH
#    \\\\purcell2k1\\soft-deploy$\\chef\\smart.bat
#    EOH
#end

### Install Java
batch 'java' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\java.bat
    EOH
end

### Install Adobe Reader
batch 'reader' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\reader.bat
    EOH
end

### Install VLC
batch 'vlc' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\vlc.bat
    EOH
end

### Install Audacity
batch 'audacity' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\audacity.bat
    EOH
end

### Install Audacity MP3 Encoder
batch 'lame' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\lame.bat
    EOH
end

### Install Mozilla Firefox
batch 'firefox' do
  code <<-EOH
    \\\\purcell2k1\\soft-deploy$\\chef\\firefox.bat
    EOH
end
