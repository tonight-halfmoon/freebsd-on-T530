
## Install

in /user/ports

change to x11-wm/compiz-fusion, then evaluate 

```
# make install clean
```



## Configure

  * Copy script file `start-compiz` into your home directory
 
  ```
    $HOME/start-compiz
  ```

  * Copy file `compiz.desktop` into `$HOME/.config/autostart/`

  ```
  $HOME/.config/autostart/compiz.desktop
  ```

   * Initial desktop configuration for smooth startup (To be able to move/resize application windows around)

    ..* Copy file `Default.ini` into `$HOME/compiz/compizconfig/` 

    ```
    .config/compiz/compizconfig/Default.ini
    ```


  * Note: Starting as usual with `startx` will also work
  * Once you are in the desktop environment, kde or xfce, etc, you could find by now Nvidia Settings App


  * Compiz requires the X composite extension to be enabled. The following command helps you out.


    ```
    xpdyinfo | grep -i composite
    ```

## Reference>
  
  *[](wiki.compiz.org)



