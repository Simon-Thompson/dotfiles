#! /bin/sh

# xinitrc for startup
ln -sf ~/dotfiles/.xinitrc ~/.xinitrc

# Install polkit and auth agent to let me use power options
pacman -S -needed --noconfirm polkit lxsession
# Install i3 additionals
pacman -S -needed --noconfirm i3lock
# feh for wallpapers
pacman -S -needed --noconfirm feh
# picom for transparency, blur and rounded corners
pacman -S -needed --noconfirm picom
# Polybar for bar stuff
pacman -S -needed --noconfirm polybar playerctl
yay -S -needed --noconfirm polybar-spotify

# tty-clock for fun
yay -S tty-clock-git

# Lutris setup
pacman -S -needed --noconfirm lutris wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader wine-mono

# Pywal and friends for theming
# Pywalfox, BetterDiscord, pywal-discord, Spicetify, zathura-pywal
pacman -S imagemagick python-pywal
chmod a+wr /opt/spotify
chmod a+wr /opt/spotify/Apps -R
yay -S -needed --noconfirm spicetify-cli betterdiscord-installer pywal-discord-git python-pywalfox
betterdiscord-installer --no-sandbox
pywalfox install
pywalfox update
git clone https://github.com/GideonWolfe/Zathura-Pywal
cd Zathura-Pywal
./install.sh
..
rm -rf Zathura-Pywal/
echo "Remember to edit set recolor false in ~/.local/bin/genzathurarc"

# Config
mkdir -p ~/.config/i3
mkdir -p ~/.config/picom
mkdir -p ~/.config/polybar
ln -sf ~/dotfiles/.config/i3/i3-config ~/.config/i3/config
ln -sf ~/dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf
ln -sf ~/dotfiles/.config/polybar/config.ini ~/.config/polybar/config.ini
ln -sf ~/dotfiles/.config/polybar/polylaunch.sh ~/.config/polybar/polylaunch.sh

# Style
mkdir -p ~/Pictures/Wallpapers
mkdir -p ~/.config/BetterDiscord/themes
mkdir -p ~/.config/spicetify
ln -sf ~/dotfiles/.config/spicetify/config-xpui.ini ~/.config/spicetify/config-xpui.ini
ln -sf ~/dotfiles/.config/BetterDiscord/themes/pywal-discord-default.theme.css ~/.config/BetterDiscord/themes/pywal-discord-default.theme.css
ln -sf ~/dotfiles/Scripts/wal-update.sh ~/Scripts/wal-update.sh
