# X Server Practical Configuration Steps - The Minumum Configurations to be able to login to Xfce session or some display manager


0. Set the Display in BIOS to Integrated Graphics

1. Install, enable and start service `dbus`

```
 # pkg install dbus

 # sysrc dbus_enable="YES"

 # service dbus start

```

2. Install Xorg and clear any Xorg configurations if any

```
 # pkg install xorg

 P.S. Do not run Xorg -configure at all
```

3. Add your username to the correct group

``` 
 # pw groupmod video -m rosemary || pw groupmod wheel -m rosemaray
```

3. Start X Server

```	
 $ startx

```

By now, you must be logged to the default X Display Manager. Log out and continue.


6. Install Xfce and Configure it as your default Xsession

```
 # pkg install xfce

 Compose ~/.xsession as follows

 #!/bin/sh
 exec /usr/local/bin/startxfce4 --with-ck-launch

 $ chmod +x ~/.xsession

 $ ln -s ~/.xsession ~/.xinitrc

 $ startx

``` 
