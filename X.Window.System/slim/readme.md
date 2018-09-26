
# Login Manager > Slim

## Simple Log-In Manager

1. Install Slim

2. One Slim installed, ~/.xsessions must be changed to the copy provided. That is 
Replace the call to exec startxfce4 .. with exec $1 in ~/.xsession.

3. Replace xdm with slim in /etc/ttys and remove nodaemon option

4. Download your favourite themes and copy them into /usr/local/share/slim/themes.

5. Make a copy of the sample Slim configuration file /usr/local/etc/slim.conf.sample in the same direcotory. There is already a file name slim.conf. Your final copy should be named slim.conf. Replace the entry current_theme in slim configuration file /etc/slim.conf with your favourite.


References>
[] https://daemon-notes.com/articles/desktop/slim
