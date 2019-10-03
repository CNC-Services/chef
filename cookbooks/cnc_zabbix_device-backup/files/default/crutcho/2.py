#!/usr/bin/python

# Import Libraries
import os
from subprocess import call
from netmiko import ConnectHandler

f=open('/home/cnc-zab/scripts/device-backup/list.txt')
for line in f:
   print line,

   switches = [ line ]
   for switch in switches:
      print 'Current switch :', line
      try:
          net_connect = ConnectHandler(device_type='cisco_ios', ip=switch, username='cnc-admin', password=os.environ['cnczabPassword'])
          net_connect.send_command("show running | redirect tftp://172.16.41.7/sw/%s.txt\n" % switch)
          net_connect.send_command("exit\n\n")
      except:
          pass

f.close()

f=open('/home/cnc-zab/scripts/device-backup/list2.txt')
for line in f:
   print line,

   switches = [ line ]
   for switch in switches:
      print 'Current switch :', line
      try:
          net_connect = ConnectHandler(device_type='dell_force10', ip=switch, username='cnc-admin', password=os.environ['cnczabPassword'])
          net_connect.send_command("copy running-config tftp://172.16.41.7/sw/%s.txt\n" % switch)
          net_connect.send_command("y\n")
          net_connect.send_command("exit")
      except:
          pass

f.close()


