#!/bin/bash

function get_brightness {
  light -get | cut -d '.' -f 1
}

function send_notification {
  icon="/usr/share/icons/Papirus/16x16/actions/contrast.svg"
  brightness=$(get_brightness)
  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq -s "─" 0 $((brightness / 5)) | sed 's/[0-9]//g')
  # Send the notification
  dunstify -i "$icon" -r 5555 -u normal "    $bar"
}

case $1 in
  up)
    # increase the backlight by 10%
    light -A 10 
    send_notification
    ;;
  down)
    # decrease the backlight by 10%
    light -U 10 
    send_notification
    ;;
esac
