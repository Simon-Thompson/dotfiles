#! /bin/sh

selected=$(find $1 -type f -name "*" | while read A ; do  echo -en "$A\x00icon\x1f$A\n"; done | rofi -theme image-preview -dmenu -show-icons)

if [ ! -z "$selected" -a "$selected" != " " ]; then
    wl-copy --type image/png < $selected
    notify-send "Copied $selected to clipboard"
fi
