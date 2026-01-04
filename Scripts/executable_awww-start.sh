#!/bin/sh

# Start daemon only if not running
pgrep -x awww >/dev/null || awww init

# Load last wallpaper if it exists
if [ -f "$HOME/.cache/last-wallpaper" ]; then
  awww img "$(cat ~/.cache/last-wallpaper)" --transition-type fade --duration 800
fi
