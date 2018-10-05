
0. Load the generic sound driver if you are not interested in the specific driver of the installed audio device in your machine

```
# kldload snd_driver
```

In case you are interested to identify the installed device card and load its driver then evaluate the following

```
$ cat /dev/sndstat
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
