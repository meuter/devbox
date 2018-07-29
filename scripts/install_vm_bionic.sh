#! /bin/bash -ex

default_ip="192.168.56.100"
default_tz=$(tzselect)

./config_tz.sh ${1:-$default_tz}
./config_sources_list.sh
./install_samba.sh ${1:-$default_ip}
./install_guest_additions.sh
./install_i3_gaps.sh
./install_fonts.sh
./install_urxvt.sh
./install_zsh.sh
./install_vscode.sh
./install_google_chrome.sh
./install_slim.sh
./install_arc.sh

reboot

