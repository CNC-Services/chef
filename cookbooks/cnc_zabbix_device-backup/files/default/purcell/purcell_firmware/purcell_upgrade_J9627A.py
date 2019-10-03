#!/usr/bin/python

# Import Libraries
import os
from subprocess import call
from netmiko import ConnectHandler

f=open('/home/cnc-zab/scripts/purcell_list_J9627A.txt')
for line in f:
   print line,

   switches = [ line ]
   for switch in switches:
      print 'Current switch :', line
      try:
          net_connect = ConnectHandler(device_type='hp_procurve', ip=switch, username='admin', password=os.environ['purcellsw'])
          net_connect.send_command("copy tftp flash 172.16.253.20 firmware/J9627A/RA_16_04_0008.swi primary\ny\n", delay_factor=2)
          net_connect.send_command("y\n")
          net_connect.send_command("copy tftp flash 172.16.253.20 firmware/J9627A/RA_16_04_0008.swi secondary\ny\n", delay_factor=2)
          net_connect.send_command("y\n")
          net_connect.send_command("reload at 20:00:00\ny\n")
          net_connect.send_command("y\n")
      except:
          pass

f.close()
