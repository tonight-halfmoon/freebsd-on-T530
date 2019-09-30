#!/bin/sh

service -R

/usr/local/share/java/kafka/bin/kafka-server-start.sh /usr/local/etc/kafka/server.properties

