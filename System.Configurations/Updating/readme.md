
Before making a release update, make sure to save yourself from a long time waste. First, check on Freshports.org whether Nvidia driver got a new version than the one installed for the current release installed.

In case you need to modify certain files like `/etc/ttys` after updating.

? boot -s

```
# fsck -y
# mount -u /
# /rescue/vim /etc/ttys
```

