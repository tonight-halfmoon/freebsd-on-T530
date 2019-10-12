
## General Guide

i * Install Font either with `pkg` or `make install`
  * Inside the installed font's directory evaluate the following command

    ```
      # mkfontdir
    ```

  * Add FontPath entry for each installed font in `/etc/X11/xorg.conf` like following

    ```
      FontPath "/usr/local/share/fonts/<FontDir>/"
    ```

  * Then, evaluate the following command

  ```
  # fc-cache -f
  ```

