#! /bin/bash

### Programs ###
# Shell
sudo pacman -S --needed --noconfirm zsh neofetch ranger
# Editor
sudo pacman -S --needed --noconfirm vim tmux
# Wallpaper - wal & dependencies
sudo pacman -S --needed --noconfirm python procps feh imagemagick python-pywal
# PDF viewing
sudo pacman -S --needed --noconfirm zathura

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### Dotfiles ###
mkdir -p ~/.config
mkdir -p ~/.config/zsh
mkdir -p ~/.config/zathura

mv -t ~/ .vimrc .zshrc .zshenv .Xresources .tmux.conf
ln -s ~/aliasrc ~/.config/zsh/aliasrc 
ln -s ~/antigen.zsh ~/.config/zsh/antigen.zsh
ln -s ~/functionrc ~/.config/zsh/functionrc
ln -s ~/zathurarc ~/.config/zathura/zathurarc

echo "Install complete!\nRemember to add shortcuts for urxvt {M-Enter} and Scripts/rofi.sh {M-d}"
