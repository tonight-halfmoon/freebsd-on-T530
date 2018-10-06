#!/bin/sh

export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

eval "$(dbus-launch --sh-syntax --exit-with-session)"
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=xim
export GTK_IM_MODULE=fcitx

/usr/local/bin/mozc start
fcitx -r -d

setxkbmap -option ctrl:nocaps

xscreensaver -no-splash &

redshift &

export __GL_YIELD="USLEEP"
nvidia-settings -l

exec $1


