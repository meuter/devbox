#! /bin/bash -ex

./config_tz.sh
./config_sources_list.sh
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

