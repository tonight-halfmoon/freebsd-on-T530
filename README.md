# FreeBSD on T530; Post-Installation Practical Steps

Experience in FreeBSD -- Setup (Post-Installation) on ThinkPad T530 and Daily Usage

## A brief

On ThinkPad T530 which configured with NVIDIA Optimus, it is necessary to set the right configurations in BIOS.

## Machine Specifications
The subject machine has the following specifications
```
hw.machine: amd64
hw.model: Intel(R) Core(TM) i7-3630QM CPU @ 2.40GHz
					(2394.62-MHz K8-class CPU)
hw.ncpu: 8

```
The subject ThinkPad T530 is built with GF108 / NVS 5400 NVIDIA Card. This is known on web as NVIDIA Optimus. In fact, the following configurations set is not only required in BSD but Arch Linux, Slackware, and Fedora, too. I have not tried with Ubuntu.

```
Check files `cpu_info`, `machine.info` for more details on the subject machine specifications
```
## Assumption
FreeBSD Installation is successful and the root password is set and it is online.

## BIOS's Display Configurations

1. Graphics Device: Discrete Graphics
2. OS Detection for NVIDIA Optimus: Disabled

## This Experience 

> To logon a FreeBSD onto a Xfce4 session on ThinkPad T530 with graphics driven by NVIDIA card


## References:

1. [FreeBSD Download](https://download.freebsd.org/ftp/doc/en/books/handbook/book.pdf)
2. [FreeBSD Books](https://download.freebsd.org/ftp/doc/en/books/arch-handbook/book.pdf)
3. [FreeBSD Forums](https://forums.freebsd.org)
4. [FreshPorts](https://freshports.org/x11/nvidia-driver/)
5. [Forums - Specific Thread](https://forums.freebsd.org/threads/how-to-solving-xorg-with-nvidia-issues-no-screens-found-ee-and-other-nasty-problems-gremlins.64941/)
6. [Wiki - Tuning Power Comsumption](https://wiki.freebsd.org/TuningPowerConsumption)
7. [IBM Thinkpad T530 2359CTO](https://wiki.freebsd.org/Laptops/Thinkpad_T530)
