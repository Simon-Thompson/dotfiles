#! /bin/bash

### Programs ###
# AUR Manager
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
rm -rf yay-git
cd ~/
# Web browser
sudo pacman -S --needed --noconfirm firefox
# File manager
sudo pacman -S --needed --noconfirm pcmanfm p7zip
# Shell
sudo pacman -S --needed --noconfirm zsh alacritty neofetch python tmuxp starship gtop
# Editor
sudo pacman -S --needed --noconfirm gvim tmux fzf ripgrep
# PDF viewing
sudo pacman -S --needed --noconfirm zathura zathura-pdf-mupdf
# Latex
sudo pacman -S --needed --noconfirm texlive-bin texlive-core texlive-latexextra
# Launcher
sudo pacman -S --needed --noconfirm rofi dmenu
# Note-taking
sudo pacman -S --needed --noconfirm obsidian syncthing

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### Dotfiles ###
# Configs
mkdir -p ~/.config/awesome
mkdir -p ~/.config/zsh
mkdir -p ~/.config/zathura
mkdir -p ~/.config/neofetch
mkdir -p ~/.config/alacritty
mkdir -p ~/.tmuxp
ln -s ~/dotfiles/rc.lua ~/.config/awesome/rc.lua
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zshenv ~/.zshenv
ln -s ~/.dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/aliasrc ~/.config/zsh/aliasrc 
ln -s ~/dotfiles/antigen.zsh ~/.config/zsh/antigen.zsh
ln -s ~/dotfiles/functionrc ~/.config/zsh/functionrc
ln -s ~/dotfiles/zathurarc ~/.config/zathura/zathurarc
ln -s ~/dotfiles/.neofetchconf ~/.config/neofetch/config.conf
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/dotfiles/todo.md ~/todo.md

# Switch to zsh
chsh -s /bin/zsh

# Setup git credential cache
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

# Install Hack Nerd Font
if fc-list | rg -q 'Hack Nerd Font'
then
    printf "Don't need to reinstall Hack Nerd Font\n"
else
    git clone https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts
    ./install.sh Hack
    cd ..
    rm -rf nerd-fonts
fi

# Make fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

printf "###\nInstall complete!\nOpen vim to run :PlugInstall\n###\n"
