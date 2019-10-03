git pull

knife cookbook upload CNC_Zabbix_Proxy
#knife cookbook upload apt
#knife cookbook upload aws
knife cookbook upload cnc_zabbix_device-backup
knife cookbook upload cron-delvalidate
knife cookbook upload crutcho_windows_generic
#knife cookbook upload forestgrove_windows_generic
#knife cookbook upload forestgrove_windows_office2016
#knife cookbook upload homebrew
knife cookbook upload justice
#knife cookbook upload justice_windows_apps
#knife cookbook upload justice_windows_generic
knife cookbook upload paden
#knife cookbook upload paden_windows_apps
#knife cookbook upload paden_windows_generic
knife cookbook upload purcell_windows_apps
knife cookbook upload purcell_windows_generic
knife cookbook upload purcell_windows_office
#knife cookbook upload windows

git add .
git commit -m "`date`" .
git push
