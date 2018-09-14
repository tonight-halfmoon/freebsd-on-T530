# High Resolution Console

## References:
http://www.freebsdwiki.net/index.php/High_Resolution_Console


cd /usr/src/sys/(<your-machine-architecture>)/conf
cp GENERIC VESAKERN
vi VESAKERN

## Kernel Configuration

add the following lines to VESAKERN:

options      VESA            # Build VESA module into kernel
options      SC_PIXEL_MODE   # Allows syscons to act on pixels rather than text

## Build & Install New Kernel

cd /usr/src
make buildkernel KERNCONF=VESAKERN
make installkernel KERNCONF=VESAKERN


vidcontrol -i mode

vidcontrol MODE_333

 to /etc/rc.conf. 
allscreens_flags="MODE_333"

