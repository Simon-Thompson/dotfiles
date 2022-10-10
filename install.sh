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
sudo pacman -S --needed --noconfirm gvim tmux fzf ripgrep geany
# PDF viewing
sudo pacman -S --needed --noconfirm zathura zathura-pdf-mupdf
# Latex
sudo pacman -S --needed --noconfirm texlive-bin texlive-core texlive-latexextra
# Launcher
sudo pacman -S --needed --noconfirm rofi dmenu
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
ln -sfn ~/dotfiles ~/dotfiles/.vimrc ~/.vimrc
ln -sfn ~/dotfiles ~/dotfiles/.zshrc ~/.zshrc
ln -sfn ~/dotfiles/.zshenv ~/.zshenv
ln -sfn ~/dotfiles/.Xresources ~/.Xresources
ln -sfn ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfn ~/dotfiles/.config/zsh/aliasrc ~/.config/zsh/aliasrc 
ln -sfn ~/dotfiles/.config/zsh/antigen.zsh ~/.config/zsh/antigen.zsh
ln -sfn ~/dotfiles/.config/zsh/functionrc ~/.config/zsh/functionrc
ln -sfn ~/dotfiles/.config/zathura/zathurarc ~/.config/zathura/zathurarc
ln -sfn ~/dotfiles/.config/neofetch/.neofetchconf ~/.config/neofetch/config.conf
ln -sfn ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sfn ~/dotfiles/Scripts/switch-audio.sh ~/Scripts/switch-audio.sh
ln -sfn ~/dotfiles/Scripts/rofi.sh ~/Scripts/rofi.sh
ln -sfn ~/dotfiles/Scripts/screenshot.sh ~/Scripts/screenshot.sh
ln -sfn ~/dotfiles/todo.md ~/todo.md

# Switch to zsh
chsh -s /bin/zsh

# Setup git credential cache
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

# Install Hack Nerd Font
if fc-list | rg 'Hack Nerd Font'
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
