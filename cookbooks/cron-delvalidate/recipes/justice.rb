#
# Cookbook Name:: cron-delvalidate
# Recipe:: Chef-Client Cron & Delete Validation.pem 
#
#

# Create crons
cron "justiceclientrun" do
  minute '15'
  hour '*/2'
  command "cd /home/cnc-zab/chef-repo/cookbooks/ && sh justice_auto.sh"
  action :create
  user 'cnc-zab'
end
