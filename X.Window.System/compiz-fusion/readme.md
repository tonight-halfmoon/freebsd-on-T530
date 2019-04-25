
## Install

in /user/ports

change to x11-wm/compiz-fusion, then evaluate 

```
# make install clean
```



## Configure

- Add the following two files to your home directory: ~/

```
~/.config/autostart/compiz.desktop
```

```
~/start-compiz
```

Note: starting as usual with `startx` will also work. Once you are in the desktop environment, kde or xfce, etc, you could find by now Nvidia Settings App.

## Reference>
 [] wiki.compiz.org

Compiz requires the X composite extension to be enabled. The following command helps you out.

$ xpdyinfo | grep -i composite


