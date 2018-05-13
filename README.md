# FreeBSD on T530

Experience in FreeBSD - Setup on ThinkPad T530 and Daily Usage


On ThinkPad T530 which configured with NVIDIA Optimus, it is necessary to set the right configurations in BIOS. 

ThinkPad T530 is built with GF108 / NVS 5400 NVIDIA Card. This is known on web as NVIDIA Optimus. In fact, the following configurations set is not only required in BSD but Arch Linux, Slackware, and Fedora, too. I have not tried with Ubuntu. 


## BIOS's Display Configurations for UNIX and LINUX

1. Screen: Digital on ThinkPad
2. Card: Discrete Graphics
3. Automatic OS search for Optimus Capability: FALSE


## Next Steps

This practical guide is the steps rackled to get a working FreeBSD with XFCE4 setup on ThinkPad T530.

The next steps are organised in each folder in this repository. Starting by X.Server and System.conf, then X.driver. And finally, xfce.

Once done you can continue to set ttyv8 'on' to directly log-on to your Xfce4 graphical platform.

## References:

https://download.freebsd.org/ftp/doc/en/books/handbook/book.pdf
https://download.freebsd.org/ftp/doc/en/books/arch-handbook/book.pdf
https://forums.freebsd.org
