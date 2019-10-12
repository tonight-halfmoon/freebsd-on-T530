
    * Boot loader

    ```
       kldload vboxdrv
    ```

      
    * Enable

    ```
       sysrc vboxnet_enable="YES"
    ```

   * Add your username

    ```
       pw groupmod vboxusers -m <username>
    ```

    *  `/dev/vboxnetctl`

    ```
       chown root:vboxusers /dev/vboxnetctl
       chmod 0660 /dev/vboxnetctl
    ```

    * USB Support

    ..* Add devfs rule [system=10] and restart

      ```
        [system=10]
        add path 'usb/*' mode 0660 group operator
      ```

      ```
        /etc/devfs.rules
        /etc/rc.d/devfs restart
      ```




  * Running VirtualBox as non-root user may fail with a fatal error

  * NS_ERROR_FACTORY_NOT_REGISTERED. 
  * In this case delete /tmp/.vbox-*-ipc file.

  * If you experience "Network: write Failed: Cannot allocate memory" errors
  * try to increase net.graph.maxdata in /boot/loader.conf

  * If you are using AIO, then increase these limits (PR#168298):

    ```
    vfs.aio.max_buf_aio=8192
    vfs.aio.max_aio_queue_per_proc=65536
    vfs.aio.max_aio_per_proc=8192
    vfs.aio.max_aio_queue=65536
    ```

   * To check if AIO is used use: 

    ```
      kldstat -v | grep aio

    ```

## On install:
### VirtualBox Guest

    * You need to enable the vboxguest startscript to load the kernel module and vboxservice to use host it synchronization.

    ```
    vboxguest_enable="YES"
    vboxservice_enable="YES"
    ```

    * You also have to add all X11 users that want to use any of the additional features (clipboard sharing, window scaling) to the wheel group.

    ```
      % pw groupmod wheel -m jerry
    ```

    * Reboot the machine to load the needed kernel modules.


## References

* [FreeBSD as a Host with VirtualBox](https://www.freebsd.org/doc/handbook/virtualization-host-virtualbox.html)
