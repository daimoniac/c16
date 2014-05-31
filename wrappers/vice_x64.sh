#!/bin/bash
ABS=~/retrocube

#save original framebuffer and hdmi mode
fbarg=$($ABS/bin/a10disp info | grep "Framebuffer dimensions" | head -1 | sed 's/^[^0-9]*\?\([0-9]\+\) x \([0-9]\+\).*/-xres \1 -yres \2/g')
yres=$($ABS/bin/a10disp info | grep "Framebuffer dimensions" | head -1 | sed 's/^[^0-9]*\?\([0-9]\+\) x \([0-9]\+\).*/\2/g')
hdmimode=$($ABS/bin/a10disp | grep "$yres" | head -1 | cut -f 1 -d " ")

#set c64 friendly mode
$ABS/bin/a10disp changehdmimode 3
#fbset -xres 720 -yres 576

#create x server
xinit $ABS/bin/wrappers/vice_startxwrapper.sh "$@"
#startx xterm

sleep 2
# reset original framebuffer and hdmi mode after x64 termination
$ABS/bin/a10disp changehdmimodeforce $hdmimode
#echo hdmimode: $hdmimode

