#! /bin/bash

# Install Sway
sudo pacman -S --needed --noconfirm sway swayidle
# Install addons
sudo pacman -S --needed --noconfirm udisks2 udiskie gammastep neomutt light mpv imv mpd mpc ncmpcpp pulseaudio pulseaudio-alsa grim wl-clipboard slurp
yay -S --needed --noconfirm swaylock-effects-git autotiling cava
# Config files
mkdir -p ~/bin
mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar
mkdir -p ~/.config/wofi
mkdir -p ~/.config/swaylock
mkdir -p ~/.config/swaynag
mkdir -p ~/.config/fontconfig
mkdir -p ~/.config/systemd/user
ln -s ~/dotfiles/bin/screenshot.sh ~/bin/screenshot.sh
ln -s ~/dotfiles/bin/partial-screenshot.sh ~/bin/partial-screenshot.sh
ln -s ~/dotfiles/bin/waybar-date.sh ~/bin/waybar-date.sh
ln -s ~/dotfiles/bin/syncthing.sh ~/bin/syncthing.sh
ln -s ~/dotfiles/.config/systemd/user/syncthing-nospam.service ~/.config/systemd/user/syncthing-nospam.service
ln -s ~/dotfiles/.config/sway/config ~/.config/sway/config
ln -s ~/dotfiles/.config/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -s ~/dotfiles/.config/waybar/style.css ~/.config/waybar/style.css
ln -s ~/dotfiles/.config/wofi/config ~/.config/wofi/config
ln -s ~/dotfiles/.config/wofi/moonfly.css ~/.config/wofi/moonfly.css
ln -s ~/dotfiles/.config/swaylock/config ~/.config/swaylock/config
ln -s ~/dotfiles/.config/swaynag/config ~/.config/swaynag/config
ln -s ~/dotfiles/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf
# Special flag for Electron
cat ~/.config/electron-flags.conf
--enable-features=UseOzonePlatform
--ozone-platform=wayland
# Polkit for startup
sudo pacman -S --needed --noconfirm polkit-gnome
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

printf "###\nSway install complete!\n###\n"
