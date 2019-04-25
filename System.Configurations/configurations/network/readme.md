# service dhclient status wlan0
--> if it is running iwth Pid xxx
then, stop it 
# service dhclient stop wlan0
# dhclient wlan0
# service dhclient start wlan0

# resolveconf -u

# service netif restart
