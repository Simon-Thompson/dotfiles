#! /bin/bash

### Bluetooth
sudo pacman -S --needed --noconfirm bluez bluez-utils blueberry
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
