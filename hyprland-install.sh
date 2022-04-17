#! /bin/bash

# Install dependencies
yay -S gdb ninja gcc cmake libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols wlroots-git
# Install Hyprland
git clone https://github.com/vaxerski/Hyprland
cd Hyprland
sudo make install
cd ..
rm -rf Hyprland
# Config
mkdir -p ~/.config/hypr
ln -s ~/dotfiles/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
# Polkit for startup
sudo pacman -S --needed --noconfirm polkit-gnome
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

printf "###\nHyprland install complete!\n###\n"
