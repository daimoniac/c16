#!/bin/bash
ABS=~/workspace/c16
x-window-manager &

# move window to center, hide menu bar
$ABS/wrappers/vice_movewindow.sh &
x64 -autostart "$@"

#echo $@
