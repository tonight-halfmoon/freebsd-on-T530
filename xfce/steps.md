# Xfce

1. pkg install xfce
2. compose a ~/.xsession file with the following contents:
   #!/bin/sh
   exec /usr/local/bin/startxfce4 --with-ck-launch

3. chmod +x ~/.xsession
4. ln -s ~/.xsession ~/.xinitrc

