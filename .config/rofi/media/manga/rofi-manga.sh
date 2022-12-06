#! /bin/sh

rofi_command="rofi -p "manga""

#### Options ###
lastSession="Open last session"
clearCache="Clear cache"
search="Search"
# Variable passed to rofi
options="$lastSession\n$clearCache\n$search"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $lastSession)
        alacritty -e /bin/zsh -c "$HOME/.config/rofi/media/manga/manga-cli.sh -l -f;"
        ;;
    $clearCache)
        alacritty -e /bin/zsh -c "$HOME/.config/rofi/media/manga/manga-cli.sh -C;"
        ;;
    $search)
        alacritty -e /bin/zsh -c "$HOME/.config/rofi/media/manga/manga-cli.sh;"
        ;;
esac

