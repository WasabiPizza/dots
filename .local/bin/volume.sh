#!/usr/bin/env bash

function get_volume {
  amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
  amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
  iconSound="/usr/share/icons/Papirus/24x24/actions/audio-volume-high.svg"
  iconMuted="/usr/share/icons/Papirus/24x24/actions/audio-volume-muted.svg"
  if is_mute ; then
    dunstify -i $iconMuted -r 2593 -u normal "mute"
  else
    volume=$(get_volume)
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq --separator="─" 0 "$((volume / 5))" | sed 's/[0-9]//g')
    # Send the notification
    dunstify -i $iconSound -r 2593 -u normal "    $bar"
  fi
}

case $1 in
  up)
    # set the volume on (if it was muted)
    amixer -q set Master on > /dev/null
    # up the volume (+ 5%)
    amixer -q  sset Master 5%+ > /dev/null
    send_notification
    ;;
  down)
    amixer -q set Master on > /dev/null
    amixer -q sset Master 5%- > /dev/null
    send_notification
    ;;
  mute)
    # toggle mute
    amixer -q set Master 1+ toggle > /dev/null
    send_notification
    ;;
esac
