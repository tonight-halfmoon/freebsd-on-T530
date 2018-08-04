#!/bin/sh

setxkbmap -option ctrl:nocaps
exec /usr/local/bin/startxfce4 --with-ck-launch
