#!/bin/sh

test -f /sys/class/power_supply/BAT0/capacity || exit 0

bat="$(cat /sys/class/power_supply/BAT0/capacity)"

[ "$bat" -eq 30 ] && notify-send --urgency normal "30%"
[ "$bat" -eq 15 ] && notify-send --urgency critical "15%"

[ -n "$bat" ] && echo "$bat% │ "

unset bat
