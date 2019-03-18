#!/bin/sh
xrandr --output DP1-2 --off	--output HDMI2 --off --output HDMI1 --off --output eDP1 --off --output DP1-2 --off --output DP1-3 --off 
xrandr --output DP1-3 --mode 1920x1080 --pos 0x0 --rotate normal
xrandr --output DP1-2 --primary --mode 1920x1080 --pos 1920x0 --rotate right
xrandr --output eDP1 --mode 1920x1080 --pos 3000x0 --rotate normal  
