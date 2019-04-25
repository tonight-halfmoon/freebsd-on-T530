
0. Load the generic sound driver if you are not interested in the specific driver of the installed audio device in your machine

```
# kldload snd_driver
```

In case you are interested to identify the installed device card and load its driver then evaluate the following

```
$ cat /dev/sndstat
```
Output>
```
Installed devices:
pcm0: <NVIDIA GT440 (HDMI/DP 8ch)> (play)
pcm1: <NVIDIA GT440 (HDMI/DP 8ch)> (play)
pcm2: <NVIDIA GT440 (HDMI/DP 8ch)> (play)
pcm3: <NVIDIA GT440 (HDMI/DP 8ch)> (play)
pcm4: <Realtek ALC269 (Analog 2.0+HP/2.0)> (play/rec) default
pcm5: <Realtek ALC269 (Internal Analog Mic)> (rec)
No devices installed from userspace.
```

From the list shown of the output you get the sound card name

Find out which FreeBSD sound driver in the documentation or some release note. For example, [FreeBSD 11.2-RELEASE Hardware Notes](https://www.freebsd.org/releases/11.2R/hardware.html#sound)

2. Check/Set the default sound device
```
 # sysctl hw.snd.default_unit
 hw.snd.default_unit: 4
```
If the output number 4 is the one you consider it is the default, it is all set.
Otherwise, from the output of `dmesg | grep pcm` find out the pcm<n> for a fix.

Other modules need to be loaded which are loaded by default in FreeBSD modern releases. However, just to double check, evaluate the following commands>

```
kldload snd_hda
```

```
kldload 
```

```
# sysctl dev.hdac.0.polling=1

```

## Solving Issue No Sound in Firefox and Chrome, but in Epiphany works!

. Remove pulseaudio package
'''
/usr/ports/audio/pulseaudio# make deinstall clean
'''

. Make sure the following packages are installed
1. gstreamer1-plugins-vpx-x.x.x
2. gstreamer1-plugins-x26xxx
3. gstreamer1-vaapi-xxx

all in /usr/ports/multimedia

. Make sure that /usr/local/etc/asound.conf.sample is copied over /usr/local/etc/asound.conf


## Reference

https://forums.freebsd.org/threads/no-sound-in-firefox.45829
