FreeBSD host
============

- Needs to set `net.link.tap.user_open` `sysctl` in order to use `/dev/tap*` networking as non-root.
Don't forget to adjust device node permissions in `/etc/devfs.rules`


