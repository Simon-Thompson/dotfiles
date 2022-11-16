#! /bin/sh

rofi_command="rofi -p "utilities""

#### Options ###
screenshot="Screenshot"
audio="Audio"
# Variable passed to rofi
options="$screenshot\n$audio"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $screenshot)
        flameshot gui -d 500
        ;;
    $audio)
        alacritty -e /bin/zsh -c "source $HOME/.zshrc; cd ~/; pulsemixer; zsh -i"
        ;;
esac

