#
# Cookbook Name:: cron-delvalidate
# Recipe:: Chef-Client Cron & Delete Validation.pem 
#
#

# Create crons
cron "clientrun" do
  minute '30'
  hour '*/4'
  command "/usr/bin/chef-client"
  action :create
end
cron "clientrunlocal" do
  minute '30'
  hour '*/4'
  command "/usr/local/bin/chef-client"
  action :create
end
