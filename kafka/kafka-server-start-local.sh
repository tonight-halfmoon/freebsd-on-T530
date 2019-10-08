#!/bin/sh

## service -R

## sysrc zookeeper_enable
## service zookeeper start
/usr/local/share/java/kafka/bin/kafka-server-start.sh /usr/local/etc/kafka/server.properties

## References
## * [GNet Solutions - FreeBSD Administration](https://project.altservice.com/issues/890)
