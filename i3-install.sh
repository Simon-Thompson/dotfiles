#! /bin/sh

sudo pacman -S polkit lxsession

# Config
mkdir -p ~/.config/i3
ln -sf ~/dotfiles/i3-config ~/.config/i3/config
