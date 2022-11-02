#! /bin/bash
# Login manager
yay -S ly
sudo systemctl enable ly.service
sudo systemctl disable getty@tty2.service
