

After configuring wpa applicant to the desired SSID with Pass Key

Evaluate the following command to get the necessary data. FreeBSD system accesses the Internet Domain Name System DNS with nameserver and domain

```
# resolveconf -v
```

Once changed SSID, change entrz 'nameserver` in file /etc/resolv.conf to match the machine router's URL.


If you want to let resolvconf to updating /etc/resolv.conf then, renmove the following line from /etc/resolvconf.conf and then evaluate 
```
# resolveconf -u
```

The line to remove is

```
resolv_conf="/dev/null" # prevent updating /etc/resolv.conf

```
sysctl net.wlan.devices
this will give you the name of the wireless adapter
Suppose the answer was 'iwn0'
Then,  add entries to /etc/rc.con to configure the network on startup
```
wlans_iwn0=wlan0
ifconfig_wlan0=WPA SYNCDHCP
```

```
#service netif restart
```

## Fix WIFI
```
ifconfig wlan0 list scan
```
ifconfig wlan0 ssid WLAN1-5G-7Y75QH
```
service netif restart
```

