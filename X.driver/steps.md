# System Configurations for X Drivers (Case NVIDIA Optimus)

1. Enable the following
	a. linux_enable="YES"
	b. nvidia_load="YES"
	c. kld_list="nvidia-modeset"
	d. dbus_enable="YES" * 

2. Set kern.vty
  	kern.vty=vt


Either add them explicitely to /boot/loader.conf and /etc/rc.conf
or evaluate the following commands:

1.
	# sysrc dbus_enable="YES"

2.
	# service dbus start


NVIDIA Driver Setup

# pkg instsall nvidia-driver


------------------------------------------
 * (this is automatically added with sysrc)