#! /bin/bash

### Programs ###
# Shell
sudo pacman -S --needed --noconfirm zsh rxvt-unicode neofetch ranger nodejs npm
# Editor
sudo pacman -S --needed --noconfirm gvim tmux
# Wallpaper - wal & dependencies
sudo pacman -S --needed --noconfirm python procps feh imagemagick python-pywal
# PDF viewing
sudo pacman -S --needed --noconfirm zathura
# launcher
sudo pacman -S --needed --noconfirm rofi
# AUR package manager
sudo pacman -S --needed --noconfirm yay
# Note-taking
yay -S --noconfirm joplin

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### Dotfiles ###
mv -t ~/ .vimrc .zshrc .zshenv .Xresources .tmux.conf
# Configs
mkdir -p ~/.config
mkdir -p ~/.config/zsh
mkdir -p ~/.config/zathura
ln -s ~/aliasrc ~/.config/zsh/aliasrc 
ln -s ~/antigen.zsh ~/.config/zsh/antigen.zsh
ln -s ~/functionrc ~/.config/zsh/functionrc
ln -s ~/zathurarc ~/.config/zathura/zathurarc
# Scripts
mkdir -p ~/Scripts
ln -s ~/wal.sh ~/Scripts/wal.sh
ln -s ~/rofi.sh ~/Scripts/rofi.sh

# Switch to zsh
chsh -s /bin/zsh
# Install placeholder theme
wal --theme sexy-numixdarkest

# Setup git credential cache
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

# Install Hack Nerd Font
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
cd ..
rm -rf nerd-fonts

printf "Install complete!\nRemember to add shortcuts for urxvt {M-Enter} and Scripts/rofi.sh {M-d}\nand add Scripts/wal.sh to .xinitrc"
