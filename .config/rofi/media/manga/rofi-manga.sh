#! /bin/sh

rofi_command="rofi -p "manga""

#### Options ###
lastSession="Open last session"
clearCache="Clear cache"
# Variable passed to rofi
options="$lastSession\n$clearCache"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $lastSession)
        alacritty -e /bin/zsh -c "$HOME/.config/rofi/media/manga/manga-cli.sh -l -f;"
        ;;
    $clearCache)
        $HOME/.config/rofi/scripts/manga-cli.sh -C
        ;;
esac

