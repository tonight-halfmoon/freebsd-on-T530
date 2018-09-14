# Configurations for NVIDIA Optimus and Intel


> 1. Enable linux

```
 # kldload linux

 # sysrc linux_enable="YES"

```

> 2. Install Nvidia and Intel Drivers

```
 # pkg install nvidia-driver

 # pkg install xf86-video-intel
	
```

> 3. Load Nvidia and Enable Nvidia as Nvidia Modeset

```
 # kldload nvidia-modeset

 # sysrc nvidia_load="YES"

 # sysrc kld_list="nvidia-modeset"
 
``` 

> 4. Enable Nvidia Optimus in BIOS and Generate Xorg Configurations

```
 # Xorg -configure

 # cp /root/xorg.conf.new /etc/X11/xorg.conf

```

> 5. Replace 'vesa' with 'intel' and set the correct VGA Devices' BusId values

```
 # pciconf -lv | grep vga

 P.S. Two VGA devices must be seen, Nvidia and Intel

 Open /etc/X11/xorg.conf and make sure the generated devices' BusId values are correct, and fix if not.

```

> 6. Load i915kms

```
 # kldload i915kms

 # sysrc i915kms_load="YES"
```

> 6. Set 'kern.vty=vt' in `/boot/loader.conf` and copy the configurations from /etc/rc.conf

```
 kern.vty=vt
 i915kms_load="YES"
 linux_enable="YES"
 nvidia_load="YES"
 kld_list="nvidia-modeset"

```

# reboot

[Now you boot in full resolution and you can login to xfce in full resolution, too]

$ startx
------------------------------------------

## References
[] http://tldp.org/HOWTO/Xterm-Title-3.html
