#! /bin/sh

rofi_command="rofi -p "Files""

chosen="$(fd --type file --hidden . "$HOME" | $rofi_command -dmenu -i)"

if [ ! -z "$chosen" ]
then
    fileDir=$(dirname "$chosen")
    alacritty -e /bin/zsh -c "cd '$fileDir'; vim '$chosen'; zsh -i; source $HOME/.zshrc"
fi
