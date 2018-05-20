# Swap Partition Practical Steps

> ! This method works as Post-Installation

```
# swapinfo
```

> ! Use the partition name shown by swapinfo to be the value of 'of' as follows

```
# dd if=/dev/random of=/dev/ada0p3 bs=1m
```

> ! Enable geli
> ! Add the following line to /boot/loader.conf

```
geom_eli_load="YES"
```

> ! Amend /etc/fstab as follows

```
/dev/ada0p3.eli none swap sw 0 0
```

> ! reboot

> ! After reboot, verify

```
# swapinfo
```

> ! One must see something similar to what follows

```
Device          1K-blocks     Used    Avail Capacity
/dev/ada0p3.eli  31457280    19392 31437888     0%
```
