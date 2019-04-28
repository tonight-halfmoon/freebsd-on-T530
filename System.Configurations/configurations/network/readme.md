# First Step 

## Find out the device of wireless network driver (assuming you wish to connect over a Wifi SSID)

```
$ pciconf -lcve
```

Then, try to find out the wireless network device model

In my case, it is `iwn`


## Check the guide on which driver necessary to load by evaluating 

```
$ man iwn
```

In my case, I was advised to either rebuild the kernel with iwn, or 
update '/boot/loader.conf' to load the driver(s)

```
check `boot_loader.conf` file provided in this repo
```

## Add the necessary configuration to make wlan0 on em0
```
check `boot_loader.conf` file provided in this repo

```
# service dhclient status wlan0
--> if it is running iwth Pid xxx
then, stop it 
# service dhclient stop wlan0
# dhclient wlan0
# service dhclient start wlan0

# resolveconf -u

# service netif restart wlan0
