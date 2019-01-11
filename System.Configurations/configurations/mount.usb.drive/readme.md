

### Add User to group `operator`

### Allow regular user to be able mount

```
# sysctl vfs.usermount=1

```
Permanent configuration in '/etc/sysctl.conf'
```
vfs.usermount=1
```

### Assure module `fuse` is loaded

```
kldload fuse.ko
```

Add the following line to '/boot/loader.conf' for permanent configuration

```
fuse_load="YES"
```

### Add the following rule to '/etc/devfs.rules
```
[localrules=5]
add path 'da*' mode 0660 group operator
```

### Enable the new rules in '/etc/rc.conf'
```
devfs_system_ruleset="localrules"
```

### Install fusefs-ext4fuse
```
# cd /usr/ports/sysutils/fusefs-ext4fuse
$ make install clean
```

### Evaluate the following command 

```
$ ext4fuse /dev/da0s1 /mnt/usbme/
```



