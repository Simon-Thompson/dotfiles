#! /bin/bash

# Install Sway
sudo pacman -S --needed --noconfirm sway swayidle
# Install addons
sudo pacman -S --needed --noconfirm udisks2 udiskie gammastep neomutt light mpv imv mpd mpc ncmpcpp pulseaudio pulseaudio-alsa grim wl-clipboard slurp electron
yay -S --needed --noconfirm swaylock-effects-git autotiling cava
# Config files
cp -asf ~/dotfiles/sway/.config ~/.config
# Special flag for Electron
cat > ~/.config/electron-flags.conf << EOF
--enable-features=UseOzonePlatform
--ozone-platform=wayland
EOF
# Polkit for startup
sudo pacman -S --needed --noconfirm polkit-gnome
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

printf "###\nSway install complete!\n###\n"
