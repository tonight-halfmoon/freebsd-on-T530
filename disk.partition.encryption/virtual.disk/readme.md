
# Encrypted Virtual Disk Practical Steps

## Preconditions
> geli is enabled

## The Steps

> ! Make a 10 GB file-backed virtual disk

```
# dd if=/dev/zero of=/path/to/somefile bs=1m count=10k
# mdconfig -f /path/to/somefile
# bsdlabel -w md0 auto
# newfs md0a
# dd if=/dev/random of=/root/<name>.key bs=64 count=1
# geli init -s 4096 -K /root/<name>.key /dev/md0
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
# geli attach -k /root/<name>.key /dev/md0
```

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
# dd if=/dev/random of=/dev/md0.eli bs=1m
# newfs /dev/md0.eli
$ mkdir /your/new/virtual.disk/mount/point
# mount /dev/md0.eli /your/new/virtual.disk/mount/point
# chown -R <your.user.name> /your/new/virtual.disk/mount/point
```

