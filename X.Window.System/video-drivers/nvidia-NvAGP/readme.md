
Correct 

```
Option "NvAGP"
```

in section `Device` in file `/etc/X11/xorg.conf`


Module `agp.ko` must be loaded.

```
kldload agp
```

It is already loaded.


Full experience with Nvidia requires "Compiz Fusion"
