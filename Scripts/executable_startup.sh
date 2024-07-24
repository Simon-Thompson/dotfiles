#! /bin/sh

# Start apps I like
# Terminal clock
exec alacritty -e /bin/zsh &
sleep 1
# Spotify
if ! pgrep -x "spotify" >/dev/null; then
  exec spotify &
  sleep 1
fi
# Discord
if ! pgrep -x "Discord" >/dev/null; then
  exec Discord &
  sleep 1
fi
# Firefox
if ! pgrep -x "firefox" >/dev/null; then
  exec firefox &
fi
# Steam
if ! pgrep -x "steam" >/dev/null; then
  exec steam &
fi
