/usr/bin/xmodmap -e "clear mod5"
/usr/bin/xmodmap -e "keycode 108 = Alt_L"

fehbg &
picom &
redshift -O3500 &
xset r rate 300 50 &

dwmblocks &
dwm &
autokey-gtk
