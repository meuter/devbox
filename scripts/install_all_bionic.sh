#! /bin/bash

# replace default source.list which does not have universe and multiverse
# by default on ubuntu server
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp ~/.dotfiles/ubuntu/bionic.list /etc/apt/sources.list

./install_guest_additions.sh
./install_fonts.sh
./install_urxvt.sh
./install_i3_gaps.sh

reboot

