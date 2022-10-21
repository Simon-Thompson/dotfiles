#! /bin/bash

### Programs ###
# AUR Manager
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay-git.git
cd yay-git/
makepkg -si
cd ..
rm -rf yay-git
cd ~/
# Web browser
sudo pacman -S --needed --noconfirm firefox
# File manager
sudo pacman -S --needed --noconfirm pcmanfm p7zip
# Shell
sudo pacman -S --needed --noconfirm zsh alacritty neofetch python tmuxp starship gtop
# Editor
sudo pacman -S --needed --noconfirm gvim tmux fzf ripgrep geany vifm
# PDF viewing
sudo pacman -S --needed --noconfirm zathura zathura-pdf-mupdf
# Latex
sudo pacman -S --needed --noconfirm texlive-bin texlive-core texlive-latexextra
# Launcher
sudo pacman -S --needed --noconfirm rofi dmenu papirus-icon-theme
# Note-taking
sudo pacman -S --needed --noconfirm obsidian syncthing
# Screenshot
sudo pacman -S -needed --noconfirm scrot xclip

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### Dotfiles ###
# Configs
mkdir -p ~/.config/zsh
mkdir -p ~/.config/zathura
mkdir -p ~/.config/neofetch
mkdir -p ~/.config/alacritty
mkdir -p ~/.tmuxp
mkdir -p ~/Scripts
ln -sf ~/dotfiles ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.Xresources ~/.Xresources
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/zsh/aliasrc ~/.config/zsh/aliasrc 
ln -sf ~/dotfiles/.config/zsh/antigen.zsh ~/.config/zsh/antigen.zsh
ln -sf ~/dotfiles/.config/zsh/functionrc ~/.config/zsh/functionrc
ln -sf ~/dotfiles/.config/zathura/zathurarc ~/.config/zathura/zathurarc
ln -sf ~/dotfiles/.config/neofetch/.neofetchconf ~/.config/neofetch/config.conf
ln -sf ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/dotfiles/todo.md ~/todo.md

# Scripts
ln -sf ~/dotfiles/Scripts/switch-audio.sh ~/Scripts/switch-audio.sh
ln -sf ~/dotfiles/Scripts/rofi.sh ~/Scripts/rofi.sh
ln -sf ~/dotfiles/Scripts/screenshot.sh ~/Scripts/screenshot.sh
ln -sf ~/dotfiles/Scripts/extract.sh ~/Scripts/extract.sh

# Switch to zsh
chsh -s /bin/zsh

# Setup git credential cache
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

# Install fonts
yay -S nerd-fonts-fantasque-sans-mono

# Make fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

printf "###\nInstall complete!\nOpen vim to run :PlugInstall\n###\n"
