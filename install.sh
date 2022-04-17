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
# Login manager
git clone --recurse-submodules https://github.com/nullgemm/ly.git
cd ly/
make
sudo make install
sudo systemctl enable ly.service
sudo systemctl disable getty@tty2.service
cd ..
rm -rf ly
cd ~
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
ln -s ~/dotfiles/.config/awesome/rc.lua ~/.config/awesome/rc.lua
ln -s ~/dotfiles/.config/awesome/autorun.sh ~/.config/awesome/autorun.sh
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zshenv ~/.zshenv
ln -s ~/.dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.config/zsh/aliasrc ~/.config/zsh/aliasrc 
ln -s ~/dotfiles/.config/zsh/antigen.zsh ~/.config/zsh/antigen.zsh
ln -s ~/dotfiles/.config/zsh/functionrc ~/.config/zsh/functionrc
ln -s ~/dotfiles/.config/zathura/zathurarc ~/.config/zathura/zathurarc
ln -s ~/dotfiles/.config/neofetch/.neofetchconf ~/.config/neofetch/config.conf
ln -s ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
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

# Enable lightdm
sudo systemctl enable lightdm
chmod +x autorun.sh

printf "###\nInstall complete!\nOpen vim to run :PlugInstall\n###\n"
