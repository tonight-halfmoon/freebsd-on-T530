# System Configurations for X Drivers (Case NVIDIA Optimus)


> 1. Enable linux

Add the following line to both files `/boot/loader.conf` and `/etc/rc.conf`

```	
 linux_enable="YES"
```

> 2. Enable nvidia

Add the following line to both files `/boot/loader.conf` and `/etc/rc.conf`

``` 	
 nvidia_load="YES"
```

> 3. Enble `nvidia-modest` as a `kld` list

Add the following line to both files `/boot/loader.conf` and `/etc/rc.conf`

```
 kld_list="nvidia-modeset"
```

> 4. Enable 'dbus' by evaluating the following command

```
 # sysrc dbus_enable="YES"
```

This command will automatically add the line `dbus_enable="YES"` to `/etc/rc.conf` 

> 5. Start Server `dbus`

```
 # service dbus start
```

> 6. Set kern.vty in `/boot/loader.conf`

```
  	kern.vty=vt
```

> Finalise

### NVIDIA Driver Setup

```
# pkg instsall nvidia-driver
```

------------------------------------------
