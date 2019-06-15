# FreeBSD on T530; Post-Installation Practical Steps

Experience in FreeBSD -- Setup (Post-Installation) on ThinkPad T530 and Daily Usage

## A brief

On ThinkPad T530 which configured with NVIDIA Optimus, it is necessary to set the right configurations in BIOS.

## Objective
Post-installation of FreeBSD is time consuming. Especially, there is no single reference guide that walk the FreeBSD user to accomplish this task. When it comes to T530 ThinkPad machine things become even harder.
In this repository I am summing up all of my experience and sharing it with you. I hope in one source you will be able to have your FreeBSD on you machine ready for daily work.

## Goal

To save your time and be able to logon a FreeBSD onto a Xfce4/KDE session on ThinkPad T530 with graphics driven by NVIDIA card

## This Experience 
This experience will let you configure your T530 machine after installation of FreeBSD in `3` folds
 
0. System
The two most important configuration files are `/boot/loader.conf` and `/etc/rc.conf`. In directory [sc](./System.Configurations/sc), you will find a working copy of those two files with comments to show the purpose of some entries.
In addition, all the necessary configurations that I needed around the two mentioned files are also copied with files including the target path on your system separated by underscore `_`.
 
0. X Server 
To setup X Server to utilise Nvidia as the Discrete Graphics provider the configurations are provided in [discrete-graphics](./X.Window.System/X.Server/discrete-graphics-profile/readme.md).
A copy of `/etc/X11/xorg.conf` is provided for your reference.

0. Video Drivers
The steps to install and configure video drivers in [video-drivers](./X.Window.System/video-drivers/readme.md)


## FreeBSD Release

Release 11.1 is originally installed and then the system is upgraded to release 11.2.
The EoL of release 11.2 is 11.3-Release + 3 months as published on [FreeBSD Security Information](https://www.freebsd.org/security/security.html#sup).

Check [Update & Upgrade Steps](./System.Configurations/Update_and_Upgrade/steps) to see how it is upgraded to release 11.2. 

## Upgrades
The system is upgraded to Release 12.0. The upgrade was not straight. It required a couple of cycles of update-related commands.  

## Machine Specifications
The subject machine has the following specifications

```
hw.machine: amd64
hw.model: Intel(R) Core(TM) i7-3630QM CPU @ 2.40GHz
					(2394.62-MHz K8-class CPU)
hw.ncpu: 8

```

The subject ThinkPad T530 is built with GF108 / NVS 5400 NVIDIA Card. This is known on web as NVIDIA Optimus. In fact, the following configurations set is not only required in BSD but Arch Linux, Slackware, and Fedora, too. I have not tried with Ubuntu.

> Check [`cpu_info`](./System.Configurations/tools/cpu_info), for more details on the subject machine specifications

## Assumption
FreeBSD Installation is successful and the root password is set and it is online.

## BIOS's Display Configurations

1. Graphics Device: Discrete Graphics
2. OS Detection for NVIDIA Optimus: Disabled


## Network Interface
In order to setup the correct firmware of the installed Network Interface (device) the following [steps](./System.Configurations/network) are provided.

## References:

1. [FreeBSD Download](https://download.freebsd.org/ftp/doc/en/books/handbook/book.pdf)
2. [FreeBSD Books](https://download.freebsd.org/ftp/doc/en/books/arch-handbook/book.pdf)
3. [FreeBSD Forums](https://forums.freebsd.org)
4. [FreshPorts](https://freshports.org/x11/nvidia-driver/)
5. [Forums - Specific Thread](https://forums.freebsd.org/threads/how-to-solving-xorg-with-nvidia-issues-no-screens-found-ee-and-other-nasty-problems-gremlins.64941/)
6. [Wiki - Tuning Power Comsumption](https://wiki.freebsd.org/TuningPowerConsumption)
7. [IBM Thinkpad T530 2359CTO](https://wiki.freebsd.org/Laptops/Thinkpad_T530)




