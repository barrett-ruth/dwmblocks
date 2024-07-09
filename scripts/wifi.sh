#!/bin/sh

station="$(iwctl station list | rg 'connected' | awk '{ print $2 }')"
station_info="$(iwctl station "$station" show)"
ssid="$(echo "${station_info#*Connected network}" | head -n 1 | xargs)"
if [ -z "$ssid" ]; then
  if ping archlinux.org -c 1 >/dev/null 2>&1; then
    ssid='eth'
  fi
fi
ssid="${ssid:-n/a}"

echo "$ssid │ "
