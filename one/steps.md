# FreeBSD on T530

Experience in FreeBSD - Setup on ThinkPad T530 and Daily Usage


On ThinkPad T530 which configured with NVIDIA Optimus, it is necessary to set the right configurations in BIOS. 

ThinkPad T530 is built with GF108 / NVS 5400 NVIDIA Card. This is known on web as NVIDIA Optimus. In fact, the following configurations set is not only required in BSD but Arch Linux, Slackware, and Fedora, too. I have not tried with Ubuntu. 


BIOS's Display Configurations for UNIX and LINUX

1. Screen: Digital on ThinkPad
2. Card: Discrete Graphics
3. Automatic OS search for Optimus Capability: FALSE


X Server and Manager

Evaluate the following: 

1. Install Xorg

	# pkg install xorg

2. Add your username to the correct group
 
	# pw groupmod video -m rosemary || pw groupmod wheel -m rosemaray

3. Install XDM
 
	# pkg install x11/xdm

3. Install XSM
	# pkg install x11/xsm

4. Run Xorg configuration to generate etc xorg configuration file

	# Xorg -configure

5. Copy the generated Xorg configuration file for users as follows

	# cp /root/xorg.conf.new /etc/X11/xorg.conf

6. Check the BusID of your display 'VGA' cards

	# pciconf -lv

7. Replace the value of entry 'BusID' in section 'Device' with the one output from step 6. For Example: vgapci0@pci0:1:0:0 for NVIDIA card. In xorg.conf replace the generated value with the value 1:0:0, in case it is wrong. Make the same thing for intel card.
 

System Configurations for X Drivers (Case NVIDIA Optimus)

1. Enable the following
	a. linux_enable="YES"
	b. nvidia_load="YES"
	c. kld_list="nvidia-modeset"
	d. dbus_enable="YES"

2. Set kern.vty
  	kern.vty=vt

Either enable the configurations by appending files /boot/loader.conf and /etc/rc.conf or by evaluating the following commands:

1. 
	# sysrc dbus_enable="YES"

2.
	# service dbus start
	

NVIDIA Driver Setup

# pkg instsall nvidia-driver


Xfce

1. pkg install xfce
2. compose a ~/.xsession file with the following contents:
   #!/bin/sh
   exec /usr/local/bin/startxfce4 --with-ck-launch

3. chmod +x ~/.xsession
4. ln -s ~/.xsession ~/.xinitrc


Now, it is time to start your X on FreeBSD

$ startx

 
