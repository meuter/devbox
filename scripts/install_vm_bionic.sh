#! /bin/bash -ex

# replace default source.list which does not have universe and multiverse
# by default on ubuntu server
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp ~/.dotfiles/ubuntu/bionic.list /etc/apt/sources.list
sudo apt update
sudo apt upgrade

./install_guest_additions.sh
./install_i3_gaps.sh
./install_fonts.sh
./install_urxvt.sh
./install_zsh.sh
./install_arc.sh
./install_slim.sh
./install_vscode.sh
./install_google_chrome.sh

reboot

