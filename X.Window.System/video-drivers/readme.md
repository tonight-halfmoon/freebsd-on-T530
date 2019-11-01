# Configurations for NVIDIA Optimus and Intel

1. Enable linux

  ```
  # kldload linux

  # sysrc linux_enable="YES"
  ```
2. Install Nvidia and Intel Drivers


  ```
  # pkg install nvidia-driver

  # pkg install xf86-video-intel
  ```

3. Load Nvidia and Enable Nvidia as Nvidia Modeset

  ```
  # kldload nvidia-modeset

  # sysrc nvidia_load=YES

  # sysrc kld_list=nvidia-modeset
  ```

* Note Check the copy of a valid [etc rc.conf](../System.Configurations/sc/etc_rc.conf)
___

4. Generating Xorg Configurations

Many ways available to auto generate the Xorg Configurations
  ___

  * Option No. 1**

  > With Nvidia Optimus using `Xorg -configure`
    If you have chosen Nvidia Optimus in BIOS, then do the following
    Enable Nvidia Optimus in BIOS and Generate Xorg Configurations as follows


    # Xorg -configure
    # cp /root/xorg.conf.new /etc/X11/xorg.conf

  > With Discrete Graphics using `nvidia-xconfig`
    If you have chosen Nvidia Optimus in BIOS, then do the following
    Enable Discrete Graphics in BIOS and Generate Nvidia-xconfig

    ```
    # nvidia-xconfig
    ```

5. In case of Nvidia Optimus, then

Replace or Add 'vesa' with 'intel' and set the correct VGA Devices' BusId values

  ```
  # pciconf -lv | grep vga
  ```

* P.S. Two VGA devices must be seen, Nvidia and Intel**
  + Open `/etc/X11/xorg.conf` and make sure the generated devices' BusId values are correct -- fix if not
  + The result of this step, is either two devices configured or one. Depending on what you want
  + Check the provided [X11 xorg configurations](../X.Server/discrete-graphics-profile/etc_X11_xorg.conf)

6. Load i915kms

Evalaute the following command

  ```
  # kldload i915kms
  ```

  + In order to persiste the loade after reboot, add the following line to `/boot/loader.conf`

  ```
  # echo "i915kms_load=YES" >> /boot/loader.conf
  ```

7. Set `kern.vty` in `/boot/loader.conf`

`vty` could be one of two options, either `vt` or `sc`. In my case I am comfortable with `sc` -
___


  ```
  kern.vty=vt
  ```

8. Append the modest of Nvidia to `/boot/loader.conf` as follows

  ```
  nvidia-modeset_load="YES"
  ```

9. Append the contents of [`/etc/rc.conf`](../../System.Configurations/sc/etc_rc.conf), [`/boot/loader.conf`](../../System.Configurations/sc/etc_rc.conf) and [`/etc/X11/xorg.conf'](../../System.Configurations/sc/etc_rc.conf) as provided in this repository.


  ```
  # reboot
  ```

* [Now you boot in full resolution and you can login to xfce in full resolution, too]

  ```
  $ startx
  ```

------------------------------------------

## References
----

[] (http://tldp.org/HOWTO/Xterm-Title-3.html)
