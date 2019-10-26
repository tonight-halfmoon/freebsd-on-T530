# XfCE4 Installation

  * Once installed with pkg or make install clean

  * Make sure the following files exist in `$HOME/` with the necessary configurations

    ..* `.xinitrc`  to start with `startx`
    ..* `.xsession` if you want to start with a desktop manager like slim
    ..* `.Xresources` %% Note the Xft.dpi: 96; See section References
    ..* `.gtkrc-2.0`


  * xfce-evolution
    Interensting themes to install as follows

    ```
    # cd /usr/ports/x11-themes/xfce-evolution && make install
    ```

    * Note:
      + `wxWidgets` or specifically `gtk` perhaps is a required dependency
        it's already installed, this is why I did not test without it.
      All in all,

      ```
      # cd /usr/ports/x11-toolkits/wxgtk30 && make install clean
      ```
      Well, currently, there are many versions 28 and 30. (check aslo x11-toolkits/wxgtk28)


## References
    * [](http://scanline.ca/dpi)
    * [](https://www.freebsd.org/doc/en_US.ISO8859-1/books/portres-handbook/using-wx.html\#wx-ver-sel-table)
    * [](https://wolo.freebsd.org/Xfce)
