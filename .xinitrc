xset -b &
xrdb ~/.Xresources &
setxkbmap -layout us -variant alt-intl &
picom -b &
clipmenud &
#udiskie &
hsetroot -solid '#c5b3a7' &
exec dbus-run-session bspwm
