
Before making a release update, make sure to save yourself from a long time waste. First, check on Freshports.org whether Nvidia driver got a new version than the one installed for the current release installed.

In case you need to modify certain files like `/etc/ttys` after updating.

? boot -s

```
# fsck -y
# mount -u /
# /rescue/vim /etc/ttys
```

Once rebooted succefully, and as suggested `freebsd-update install` needs to run once again.

After a successful install, the packages of the system need to be updated as well.

Evaluate the following

```
# portmaster -afGD
```

Option `G` will automatically choose the default configuration of each package without a prompt
