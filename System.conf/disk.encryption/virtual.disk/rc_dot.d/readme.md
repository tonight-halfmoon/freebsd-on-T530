# Configuration to attach Virtual Disk during Phase # 4 of booting FreeBSD

## Extend `rc.d` to configure this feature

> Compose a bash script, make it executable and add it to `/usr/local/etc/rc.d` 

```
 Check sample file named ['rc_dot.d_encrvd_attach'](./rc_dot.d_encrvd_attach)
```

## Enable it at `/etc/rc.conf`

> As usual enabling by adding the following line to `/etc/rc.conf`

```
 encrvd_attach_enable="YES"
```

-------------------------------------------------------------------------------
