#!/bin/sh
#
#
# Disable Caps Lock key
setxkbmap -option ctrl:nocaps

export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

### Reference> http://srobb.net/jpninpt.html#FreeBSD
#eval "$(dbus-launch --sh-syntax --exit-with-session)"
#export XMODIFIERS="@im=fcitx"
#export QT_IM_MODULE=xim
#export GTK_IM_MODULE=fcitx

/usr/local/bin/mozc start
fcitx -r -d

## Redshift
redshift &

## Pulse Audio
start-pulseaudio-x11 &

# Logging startx
exec 1>  /home/rosemary/logwhilestartingupxfce4fromslim_2 2>&1
#echo $1 >&2


#$exec /usr/local/bin/startxfce4 --with-ck-launch
 
exec $1
