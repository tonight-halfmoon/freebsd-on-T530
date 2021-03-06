# Configure Network Interface

##### Find out the device of wireless network driver (assuming you wish to connect over a Wifi SSID)


```
$ pciconf -lcve
```

##### Find out the wireless network device model

> In my case, it is `iwn`

##### Find out the firmware of the network device

Search for the exact name of the interface firmware. Once found you can easily find out what to choose to be loaded from the following step

##### Check the `iwn` manual on which driver is necessary to load

```
$ man iwn
```

> In my case, I was advised to either rebuild the kernel with iwn, or
update '/boot/loader.conf' to load the driver(s) with one driver from a given list.
From the previous step I concluded that the interface firmware installed on machine needs the following driver to be loaded by `/boot/loader.conf`.

```
# echo -e "iwn6000g2afw_load=\"YES\"" >> /boot/loader.conf

```

##### Add the necessary configuration to make wlan0 on em0

> Check `boot_loader.conf` file provided in this repository

```
# service dhclient status wlan0
```

> if it is running with Pid, then, stop it

##### Continue with the following steps

```
# service dhclient stop wlan0
```

```
# dhclient wlan0
```

```
# service dhclient start wlan0
```

```
# resolveconf -u
```
> Make sure to allow 'resolveconf -u' to amend file '/etc/resolv.conf'. Enabling is done by editing file `/etc/resolvconf.conf`. Comment out the following line

```
#resolv_conf="/dev/null" 
```

```
# service netif restart wlan0
```

```
wpa_supplicant -c /etc/wpa_supplicant.conf -B -i wlan0
```

* In case the dhclient service is not restarting successfully, then
remove hanging pid if any

```
# rm "_ /var/run/dhclient/dhclient.<your-net-interface-name>.pid %% in my case wlan0
```

