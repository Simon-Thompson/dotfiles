#! /bin/bash
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

# Enable lightdm
sudo systemctl enable lightdm
chmod +x autorun.sh
