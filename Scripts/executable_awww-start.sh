#!/bin/sh

# Start daemon only if not running
pgrep -x awww >/dev/null || awww-daemon &

# Load last wallpaper if it exists
if [ -f "$HOME/.cache/last-wallpaper" ]; then
  awww img "$(cat ~/.cache/last-wallpaper)" --transition-type fade --duration 800
else
  exec ~/Scripts/awww_randomize_multi.sh ~/Pictures/Wallpapers
fi
