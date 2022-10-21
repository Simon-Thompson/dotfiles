#! /bin/sh

# Install polkit and auth agent to let me use power options
sudo pacman -S -needed --noconfirm polkit lxsession
# Install i3 additionals
sudo pacman -S -needed --noconfirm i3lock

# Config
mkdir -p ~/.config/i3
ln -sf ~/dotfiles/i3-config ~/.config/i3/config
