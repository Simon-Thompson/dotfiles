#! /bin/sh

rofi_command="rofi -p "media""

#### Options ###
games="  Games"
manga="  Manga"
# Variable passed to rofi
options="$games\n$manga"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $games)
        echo "TODO games menu"
        ;;    
    $manga)
        $HOME/.config/rofi/media/manga/rofi-manga.sh
        ;;
esac

