#! /bin/bash

### Programs ###
# AUR package manager
sudo pacman -S --needed --noconfirm yay
# Shell
sudo pacman -S --needed --noconfirm zsh rxvt-unicode neofetch ranger nodejs npm w3m clang
# Editor
sudo pacman -S --needed --noconfirm gvim tmux
# Wallpaper - wal & dependencies
sudo pacman -S --needed --noconfirm python procps feh imagemagick python-pywal
# PDF viewing
sudo pacman -S --needed --noconfirm zathura
# launcher
sudo pacman -S --needed --noconfirm rofi
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
mkdir -p ~/.config/ranger
ln -s ~/aliasrc ~/.config/zsh/aliasrc 
ln -s ~/antigen.zsh ~/.config/zsh/antigen.zsh
ln -s ~/functionrc ~/.config/zsh/functionrc
ln -s ~/zathurarc ~/.config/zathura/zathurarc
ln -s ~/rc.conf ~/.config/ranger/rc.conf
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

# !Important
# Open vim and run :PlugInstall to install all its plugins. Coc should download all of its plugins when vim is opened as well
# Run :CocCommand clangd.install FROM A C++ FILE to download clangd, restart the terminal and make sure it's been added to the path

# Useful commands that aren't included in this install

### Run this command to create a compile_commands.json for clangd to read ###
# cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
# More at https://clangd.llvm.org/installation.html#project-setup

### Mount NTFS drive for Steam Play in /etc/fstab ###
# UUID=<your UID here>			  /run/media/vacuum/<whatever folder>		 ntfs-3g	 defaults,exec,uid=1000,gid=1000 0 2
