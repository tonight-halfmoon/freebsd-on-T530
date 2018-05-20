
# Encrypted Virtual Disk Practical Steps

## Preconditions

> geli is enabled


## The Steps

> ! Make a 10 GB file-backed virtual disk

```
 % dd if=/dev/zero of=/home/<username>/vnimg.ebucket bs=64M count=160
 # mdconfig -a -t vnode -f /home/<username>/vnimg.ebucket -u 0
 # bsdlabel -w md0 auto
 # newfs md0a
 # dd if=/dev/random of=/root/md0.key bs=64 count=1
 # geli init -s 4096 -K /root/md0.key /dev/md0
```

> ! Interactive:

```
Enter new passphrase:
Reenter new passphrase:
```

> ! Success Output

```
Metadata backup can be found in /var/backups/md0.eli and
can be restored with the following command:

	# geli restore /var/backups/md0.eli /dev/md0
```

> Attach it

```
 # geli attach -k /root/md0.key /dev/md0
```

> ! Interactive

Enter passphrase: 


> ! check result


```
 # ls /dev/md
```

> ! System output

```
md0% md0.eli% mdctl%
```

> Finalise

```
# dd if=/dev/random of=/dev/md0.eli bs=64M
```

> ! System output


```
dd: /dev/md0.eli: short write on character device
dd: /dev/md0.eli: end of device
160+0 records in
159+1 records out
10737414144 bytes transferred in 225.093408 secs (47702037 bytes/sec)
```

```
# newfs /dev/md0.eli
```

> ! System output

```
md0%     md0.eli% mdctl%   
root@tonight:/home/rosemary # newfs /dev/md0.eli 
/dev/md0.eli: 10240.0MB (20971512 sectors) block size 32768, fragment size 4096
	using 17 cylinder groups of 626.09MB, 20035 blks, 80256 inodes.
super-block backups (for fsck_ffs -b #) at:
 192, 1282432, 2564672, 3846912, 5129152, 6411392, 7693632, 8975872, 10258112, 11540352,
 12822592, 14104832, 15387072, 16669312, 17951552, 19233792, 20516032

```


```
$ mkdir /virtual.disk.mount.point
```


```
# mount /dev/md0.eli /virtual.disk.mount.point
```

> ! Check result


```
# df -H
```

> ! System output

```
Filesystem      Size    Used   Avail Capacity  Mounted on
/dev/ada0p2     5.2G    517M    4.3G    11%    /
devfs           1.0k    1.0k      0B   100%    /dev
/dev/ada0p4     5.2G    873M    3.9G    18%    /var
/dev/ada0p5     2.1G     18M    1.9G     1%    /tmp
/dev/ada0p6     204G     18G    169G    10%    /usr
/dev/md0.eli     10G    8.2k    9.6G     0%    /virtual.disk.mount.point

```

```
# chown -R <your.user.name> /virtual.disk.mount.point
```

> ! Umount, detach and Freeup all resources

```
 # umount /virtual.disk.mount.point
```

```
 # geli detach md0.eli
```

```
 # mdconfig -d -u 0
```

## Steps after a reboot

> Attach the encrypted virtual disk

```
 # mdconfig -a -t vnode -f /home/<username>/vnimg.ebucket -u 0
```

```
 # geli attach -k /root/md0.key /dev/md0

```
 # mount /dev/md0.eli /home/<username>/virtual.disk.mount.point/

```
