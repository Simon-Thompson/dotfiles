#! /bin/sh

rofi_command="rofi -p "manga""

#### Options ###
lastSession="Open last session"
search="Search"
clearCache="Clear cache"
# Variable passed to rofi
options="$lastSession\n$clearCache\n$search"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $lastSession)
        alacritty -e /bin/zsh -c "mangal -c"
        ;;
    $clearCache)
        mangal clear -c
        ;;
    $search)
        alacritty -e /bin/zsh -c "mangal -S Mangapill"
        ;;
esac

