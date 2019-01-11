# X Server Practical Configuration Steps - The Minumum Configurations to be able to login to Xfce session running on Nvidia

0. Set the Display in BIOS to Discrete Graphics

1. Install, enable and start service `dbus`

```
 # pkg install dbus

 # sysrc dbus_enable="YES"

 # service dbus start

```

2. Enable hald

```
 # sysrc hald_enable="YES"

 # service hald start 
```

3. Install Xorg and clear any Xorg configurations if any

```
 # pkg install xorg

 P.S. Do not run Xorg -configure at all
```

4. Add your username to the correct group

```
 # pw groupmod video -m rosemary || pw groupmod wheel -m rosemaray
```

5. Install Nvidia driver

```
 # portmaster -R x11/nvidia-driver
```

6. Evaluate `nvidia-xconfig`

```
 # nvidia-xconfig
```
7. Append the `/etc/X11/xorg.conf` as shown in the sample xorg_dot.conf provided

8. Start X Server

```
 $ startx

```

By now, you must be logged to the default X Display Manager. Log out and continue.


9. Install Xfce and Configure it as your default Xsession

```
 # pkg install xfce

 Compose ~/.xsession as follows

 #!/bin/sh
 exec /usr/local/bin/startxfce4 --with-ck-launch

 $ chmod +x ~/.xsession

 $ ln -s ~/.xsession ~/.xinitrc

 $ startx

```

10. Install and try Slim as a Login Manager

```
 # portmaster -R x11/slim

 # service slim onestart

```

11. Setup Slim Login Manager

```

 11.1 Replace item `ttyv8` line / Append in `/etc/ttys` with the following line
	ttyv8   '/usr/local/bin/slim'  xterm  on  secure
 11.2 Append `/etc/rc.conf` with
	slim_enable="YES"
```

12. Setup `synaptics` 

```
 12.1 Download module synaptics
 12.2 Configure `xorg.conf` as shown in the example provieded 

```

13. Compiz Fusion

check [Compiz](../../compiz-fusion)

