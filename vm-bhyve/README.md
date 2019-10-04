### Sample working configuration for vm-bhyve

* Example system.conf.example provided, could be added to the work directory

```
/usr/home/vm
```

* Example _etc_pf_dot.conf.example could be used to append system's `/etc/pf.conf`


- Check [Guide](./../System.Configurations/network/net.link.tap/guide.md) on setting `tap` networking as non-root

- If you want to use usb devices connected to the host in the guest you need either recent 10-current or you can use `usbredir` over the network (see below); also unless you are running `qemu` as `root` you then need to fix permission for `/dev/ugen*` device nodes: if you aer on 5.x or later (devfs) put a rule in `/etc/devfs.rules`, activate it in `/etc/rc.conf` and run `/etc/rc.d/devfs restart`. Example devfs.rules:

```
  [ugen_ruleset=20]
  add path 'ugen*' mode 660 group operator
```

corresponding `rc.conf` line:

```
  devfs_system_ruleset="ugen_ruleset"

```
