#!/bin/sh
#
#
# Disable Caps Lock key
setxkbmap -option ctrl:nocaps

# Quiet - Turn Off Beep
xset b off

export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

### Reference> http://srobb.net/jpninpt.html#FreeBSD
eval "$(dbus-launch --sh-syntax --exit-with-session)"
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=xim
export GTK_IM_MODULE=fcitx

/usr/local/bin/mozc start
fcitx -r -d

## Redshift
redshift &

## Pulse Audio
start-pulseaudio-x11 &

# Logging startx
exec 1> "$HOME"/logwhilestartingupxfce4fromslim 2>&1
echo $1 >&2

#xscreensaver -no-splash &
#export __GL_YIELD="USLEEP"
#nvidia-settings -l

#exec /usr/local/bin/startxfce4 --with-ck-launch --disable-wm-check
exec --disable-wm-check /usr/local/bin/startxfce4
