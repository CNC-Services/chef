#
# Cookbook Name:: cron-delvalidate
# Recipe:: Chef-Client Cron & Delete Validation.pem 
#
#

# Create crons
cron "clientrun" do
  minute '0'
  hour '*/4'
  command "/usr/bin/chef-client"
  action :create
end
cron "clientrunlocal" do
  minute '0'
  hour '*/4'
  command "/usr/local/bin/chef-client"
  action :create
end
cron "clientrunproxy" do
  day '1'
  minute '0'
  hour '1'
  command "/bin/touch /home/cnc-zab/proxy.txt"
  action :create
end
