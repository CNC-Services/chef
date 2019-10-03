#!/usr/bin/python

# Import Libraries
import os
from subprocess import call
from netmiko import ConnectHandler

f=open('/home/cnc-zab/scripts/purcell_list.txt')
for line in f:
   print line,

   switches = [ line ]
   for switch in switches:
      print 'Current switch :', line
      try:
          net_connect = ConnectHandler(device_type='hp_procurve', ip=switch, username='admin', password=os.environ['purcellsw'])
          net_connect.send_command("copy running-config tftp 172.16.253.20 purcell/%s.txt\n" % switch)
          net_connect.send_command("y")
      except:
          pass

f.close()
