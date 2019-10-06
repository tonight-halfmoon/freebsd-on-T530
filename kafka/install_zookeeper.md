## Install Zookeeper on FreeBSD

### References
* [GNet Solutions - FreeBSD Administration](https://project.altservice.com/issues/890)

### Steps

```
	pkg update && pkg upgrade
 	pkg install zookeeper
  	diff /etc/passwd /etc/master.passwd
  	pwd_mkdb -p /etc/master.passwd
  	pkg install zookeeper
  	echo "pwd_mkdb -p /etc/master.passwd" > /home/rosemary/freebsd-on-T530/fix_user_disappeared_during_update
  	echo 1 > /var/db/zookeeper/myid
  	chown -R zookeeper:zookeeper /var/db/zookeeper
  	vim /usr/local/etc/zookeeper/zoo.cfg
  	cp /usr/local/etc/zookeeper/zoo_example.cfg /usr/local/etc/zookeeper/zoo.cfg
	sysrc zookeeper_enable
  	service zookeeper start
```
