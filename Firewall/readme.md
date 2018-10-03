0. Let's first find out the wireless network device. Suppose we are interested in Wireless Network.
# sysctl net.wlan.devices

0. load the firmware 
# kldload if_iwn 
This command will include all available firmware drivers
For more detail: $ man iwn

Then, let's find out the firmware of your network device
The device listed upon command # pciconf -lv | grep device

device     = 'Centrino Advanced-N 6205 [Taylor Peak]'


# cd /usr/src/sys/modules/iwnfw/iwn6000g2b/
# make
# kldload iwn6000g2bfw
# service netif restart

0. Now, it is time to append `/boot/loader.conf` with the following line

1. cp /usr/share/examples/pf/pf.conf /etc.pf.con
2. Set your rules
3. # service pf onestart

At this moment service 'pf' must start temporarily until machine is rebooted.

Now, let's enable service 'pf'.

4. Append `/etc/rc.conf` with the following line
  pf_enable="YES"

Reference>

http://daemon-notes.com/articles/network/pf
