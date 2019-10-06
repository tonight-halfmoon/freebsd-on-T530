#!/bin/sh

service -R

sysrc zookeeper_enable
service zookeeper start
/usr/local/share/java/kafka/bin/kafka-server-start.sh /usr/local/etc/kafka/server.properties

