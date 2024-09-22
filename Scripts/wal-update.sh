#! /bin/sh

wal -i $1

# Update spicetify and firefox wal themes
spicetify apply
pywalfox update

# Discord, rofi, zathura, alacritty & vim should update automatically

