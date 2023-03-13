#! /bin/bash

### Programs ###
# AUR Manager
pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay-git.git
cd yay-git/
makepkg -si
cd ..
rm -rf yay-git
cd ~/
# Web browser
pacman -S --needed --noconfirm firefox
# File manager
pacman -S --needed --noconfirm thunar thunar-archive-plugin p7zip file-roller
# Shell
pacman -S --needed --noconfirm zsh alacritty neofetch python tmuxp starship gtop
# Editor
pacman -S --needed --noconfirm gvim tmux fzf ripgrep fd geany nnn
yay -S --needed --noconfirm dragon-drop
pip install ueberzug
# PDF viewing
pacman -S --needed --noconfirm zathura zathura-pdf-mupdf
# Latex
pacman -S --needed --noconfirm texlive-bin texlive-core texlive-latexextra
# Launcher
pacman -S --needed --noconfirm rofi dmenu papirus-icon-theme
# Note-taking
pacman -S --needed --noconfirm obsidian syncthing
# Screenshot
pacman -S --needed --noconfirm scrot xclip
# Manga
yay -S --needed --noconfirm mangal-bin
# Remote to windows
pacman -S --needed --noconfirm remmina freerdp

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### Dotfiles ###
# Configs
mkdir -p ~/.tmuxp
mkdir -p ~/Scripts
find ~/dotfiles/home -type f -exec ln -sf {} ~/ \; -print
cp -asf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/todo.md ~/todo.md

# Scripts
find ~/dotfiles/Scripts -type f -exec ln -sf {} ~/Scripts \; -print

# Switch to zsh
chsh -s /bin/zsh

# Setup git credential cache
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

# Install fonts
yay -S nerd-fonts-fantasque-sans-mono

# Make fzf use ripgrep
export FZF_DEFAULT_COMMAND='fd --type file --hidden --no-ignore'

# Enable and start syncthing
systemctl enable syncthing@vacuum.service
systemctl start syncthing@vacuum.service

printf "###\nInstall complete!\nOpen vim to run :PlugInstall\n###\n"
