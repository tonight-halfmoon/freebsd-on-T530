

* Once `wpa applicant` is configured to the desired SSID with Pass Key

* Evaluate the following command to get the necessary data. 

* FreeBSD system accesses the Internet Domain Name System DNS with nameserver and domain


```
# resolveconf -v
```


* Once SSID is changed, then the entry 'nameserver` in file `/etc/resolv.conf` must be altered to match the machine router's URL.

* However, the following command should do that automcatically as follows

```
# resolveconf -u
```

* If `resolveconf` fails to update the file, then the following line needs to be commented out


```
resolv_conf="/dev/null" # prevent updating /etc/resolv.conf

```

* To configure `/etc/rc.conf` correctly for your machine wireless adapter, then you need the exact name. This can be found as follows

```
sysctl net.wlan.devices
```

* It will give you the name of the wireless adapter

* Suppose the answer was 'iwn0'

* Then, add entries to `/etc/rc.conf` to configure the network on startup

```
wlans_iwn0=wlan0
ifconfig_wlan0=WPA SYNCDHCP
```

* Now restart the service

```
#service netif restart
```

* More fixes on Wifi

```
ifconfig wlan0 list scan
```

```
ifconfig wlan0 ssid WLAN1-5G-7Y75QH
```

```
service netif restart
```

