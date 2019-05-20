# Configurations for NVIDIA Optimus and Intel


> 1. Enable linux

```
 # kldload linux

 # sysrc linux_enable="YES"

```

> 2. Install Nvidia and Intel Drivers
 Note: if you prefer installing wiht ports, then replace pkg with make install on each package directory inside /usr/ports

```
 # pkg install nvidia-driver

 # pkg install xf86-video-intel
	
```

> 3. Load Nvidia and Enable Nvidia as Nvidia Modeset

```
 # kldload nvidia-modeset

 # sysrc nvidia_load=YES

 # sysrc kld_list=nvidia-modeset
 
``` 

Note> Check the copy of a valid [etc rc.conf](../System.Configurations/sc/etc_rc.conf)

> 4. 

	[] With Nvidia Optimus
	If you have chosen Nvidia Optimus in BIOS, then do the following
	Enable Nvidia Optimus in BIOS and Generate Xorg Configurations
```
	# Xorg -configure
 	# cp /root/xorg.conf.new /etc/X11/xorg.conf

```

	[] With Discrete Graphics
	If you have chosen Nvidia Optimus in BIOS, then do the following
	Enable Discrete Graphics in BIOS and Generate Nvidia-xconfig
```
	# nvidia-xconfig      

```

> 5. [] In case of Nvidia Optimus, then 
	 Replace 'vesa' with 'intel' and set the correct VGA Devices' BusId values

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

> 7. Append the contents of [`/etc/rc.conf`](../../System.Configurations/sc/etc_rc.conf), [`/boot/loader.conf`](../../System.Configurations/sc/etc_rc.conf) and [`/etc/X11/xorg.conf'](../../System.Configurations/sc/etc_rc.conf) as provided in this repository.


# reboot

[Now you boot in full resolution and you can login to xfce in full resolution, too]

$ startx
------------------------------------------

## References
[] http://tldp.org/HOWTO/Xterm-Title-3.html
