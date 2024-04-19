#!/bin/sh

test -f /sys/class/power_supply/BAT0/capacity || exit 0

bat="$(cat /sys/class/power_supply/BAT0/capacity)"

[ -n "$bat" ] && echo "$bat% │ "

unset bat
