#!/bin/zsh
#. "${HOME}/.cache/wal/colors.sh"

#bg=$color0
#border=$color2
#separator=$color2
#fg=$color7
#bgalt=$color0
#urgent=$color9
#fgalt=$color7
#hlbg=$color2
#hlfg=$color0

# argument $1 expected to be window/run
rofi -show run \
    -lines 6 \
    -eh 2 \
    -width 50 \
    -font "Hack Nerd Font Mono 14" \
    -color-window "$bg, $fg, $border" \
    -color-normal "$bg, $fg, $bgalt, $hlbg, $hlfg" \
    -color-urgent "$bg, $urgent, $bgalt, $urgent, $fg" \
    -color-active "$bg, $fg, $bgalt, $hlbg, $hlfg"
