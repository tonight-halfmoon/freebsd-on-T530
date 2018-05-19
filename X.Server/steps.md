# X Server Practical Configuration Steps

> Evaluate the following

1. Install Xorg

```
	# pkg install xorg
```

2. Add your username to the correct group

``` 
	# pw groupmod video -m rosemary || pw groupmod wheel -m rosemaray
```

3. Install XDM

```
	# pkg install x11/xdm
```

3. Install XSM

```
	# pkg install x11/xsm
```

4. Run Xorg configuration to generate etc xorg configuration file

```
	# Xorg -configure
```

5. Copy the generated Xorg configuration file for users as follows

```
	# cp /root/xorg.conf.new /etc/X11/xorg.conf
```

6. Check the BusID of your display 'VGA' cards

```
	# pciconf -lv | grep vga
```

7. Replace the value of entry 'BusID' in section 'Device' with the one output from step 6. For Example: vgapci0@pci0:1:0:0 for NVIDIA card. In xorg.conf replace the generated value with the value 1:0:0, in case it is wrong. Make the same thing for intel card.
