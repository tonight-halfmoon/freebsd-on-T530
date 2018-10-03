# FreeBSD on T530; Post-Installation Practical Steps

Experience in FreeBSD -- Setup (Post-Installation) on ThinkPad T530 and Daily Usage

## A brief

On ThinkPad T530 which configured with NVIDIA Optimus, it is necessary to set the right configurations in BIOS.

ThinkPad T530 is built with GF108 / NVS 5400 NVIDIA Card. This is known on web as NVIDIA Optimus. In fact, the following configurations set is not only required in BSD but Arch Linux, Slackware, and Fedora, too. I have not tried with Ubuntu.

# Assumption
FreeBSD Installation is successful and the root password is set and it is online.

# Empirical Post-Intsallation


## BIOS's Display Configurations for UNIX and LINUX

1. Graphics Device: Discrete Graphics
2. OS Detection for NVIDIA Optimus: Disabled


## The output of these steps

> To logon a FreeBSD onto a Xfce4 session on ThinkPad T530 with graphics driven by NVIDIA card


## Overview

> The steps are organised in mainly 3 folders. Starting by [`X.Server`](./X.Server) and then [`X.driver`](./X.driver). 

The two cardinal files resulted in these steps are found in folder [`System.conf`](./System.conf). And finally, [`xfce`](/xfce).

A complete list is in [`one`](./one/readme.md).

Once done you can continue to set `ttyv8` to `'on'`. As usual, to directly log-on to your Xfce4 graphical platform.


## References:

1. [FreeBSD Download](https://download.freebsd.org/ftp/doc/en/books/handbook/book.pdf)
2. [FreeBSD Books](https://download.freebsd.org/ftp/doc/en/books/arch-handbook/book.pdf)
3. [FreeBSD Forums](https://forums.freebsd.org)
4. [FreshPorts](https://freshports.org/x11/nvidia-driver/)
5. [Forums - Specific Thread](https://forums.freebsd.org/threads/how-to-solving-xorg-with-nvidia-issues-no-screens-found-ee-and-other-nasty-problems-gremlins.64941/)
6. [Wiki - Tuning Power Comsumption] (https://wiki.freebsd.org/TuningPowerConsumption)
7. [IBM Thinkpad T530 2359CTO] (https://wiki.freebsd.org/Laptops/Thinkpad_T530)
