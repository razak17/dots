#!/bin/sh

/usr/bin/xmodmap -e "clear mod5"
/usr/bin/xmodmap -e "keycode 108 = Alt_L"

xset r rate 300 50 &
fehbg &
picom -o .65 &
redshift -O3500 &
dwmblocks &
dwm &
autokey-gtk
