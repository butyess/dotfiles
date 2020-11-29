#!/bin/bash

rofi -show drun \
-modi "drun,file-browser,run" \
-terminal 'tilix --window-style=disable-csd-hide-toolbar --profile=Bspwm' \
-m $(bspc query -M -m focused --names)
