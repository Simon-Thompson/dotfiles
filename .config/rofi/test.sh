#! /bin/sh

ls ~/Pictures/Memes | while read A ; do  echo -en "$A\x00icon\x1f~/Pictures/Memes/$A\n"; done | rofi -dmenu -show-icons
