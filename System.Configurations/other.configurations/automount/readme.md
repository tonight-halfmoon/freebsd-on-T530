## Mounting and Automounting of Removable Media

### Mounting Linux System USB Drive, like Slackware

0. Add User to group `operator`

0. Allow regular user mount

```
# sysctl vfs.usermount=1

```

```
Permanent configuration in '/etc/sysctl.conf'
```

```
vfs.usermount=1
```

0. Load module `fuse`


```
kldload fuse.ko
```

> Add the following line to '/boot/loader.conf' for permanent configuration

```
fuse_load="YES"
```

0. Add the following rule to `/etc/devfs.rules`

```
[localrules=5]
add path 'da*' mode 0660 group operator
```

0. Enable the new rule in `/etc/rc.conf`

```
devfs_system_ruleset="localrules"
```

0. Check and enable service `automount`

```
# service automount restart
```

> In case the reply was `Cannot 'restart' automount...` Then continue as follows

```
# sysrc autofs_enable
```

> If the reply was `autofs_enable: No`, then enable it as follows

```
# sysrc autofs_enable="YES"
```

0. Start service `automount`

```
# service automount start
```

0. Start service `devd`

```
# service devd restart
```

0. Start daemon of service `automountd`

```
# service automountd start
```

0. Start daemon of service 'autounmountd'

```
# service autounmountd start
```

0. Install fusefs-ext4fuse

```
# cd /usr/ports/sysutils/fusefs-ext4fuse
$ make install clean
```

0. Evaluate Mount command

```
$ ext4fuse /dev/da0s1 /mnt/usbme/
```
