#
# Cookbook:: cnc_zabbix_device-backup
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Deploy and run the collect script
## Purcell
case node['hostname']
#Push Files
when 'Purcell'
  cookbook_file "/home/cnc-zab/scripts/purcell_list.txt" do
    source "purcell/purcell_list.txt"
  end
  cookbook_file "/home/cnc-zab/scripts/purcell_collect.py" do
    source "purcell/purcell_collect.py"
  end
  cookbook_file "/home/cnc-zab/scripts/purcell_collect.sh" do
    source "purcell/purcell_collect.sh"
  end
  cookbook_file "/home/cnc-zab/scripts/purcell_copy.sh" do
    source "purcell/purcell_copy.sh"
  end
#Execute Scripts
  execute 'collect' do
    command "bash /home/cnc-zab/scripts/purcell_collect.sh"
  end
  execute 'copy' do
    command "sh /home/cnc-zab/scripts/purcell_copy.sh"
  end
else
 execute 'echo' do
   command "echo hostname does not match"
 end
end
