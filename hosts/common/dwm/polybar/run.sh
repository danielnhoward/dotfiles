#!/usr/bin/env sh

if pgrep '^polybar' > /dev/null; then
  exit 0
fi

polybar --config=/etc/polybar/config.ini &
