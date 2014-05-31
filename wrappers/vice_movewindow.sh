#!/bin/bash
xdotool mousemove -- -25 -27
for i in $(seq 1 15); do
  xdotool getactivewindow windowmove -- -25 -27
  sleep 1
done

