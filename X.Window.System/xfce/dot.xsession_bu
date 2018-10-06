#!/bin/sh

setxkbmap -option ctrl:nocaps

### Reference> http://srobb.net/jpninpt.html#FreeBSD

#export LC_CTYPE=en_US.UTF-8

#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=xim
#export XMODIFIERS=@im=fcitx
#/usr/local/bin/mozc start
#fcitx -r -d

#start-pulseaudio-x11 &
exec 1>  /home/rosemary/logwhilestartingupxfce4fromslim 2>&1
echo $1 >&2
redshift &
exec /usr/local/bin/startxfce4 --with-ck-launch
 
