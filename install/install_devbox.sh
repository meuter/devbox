#! /bin/bash -e

source ./authenticate.sh

./detect_guest_addition.sh
./config_grub.sh
./config_sources_list.sh
./install_core.sh
./config_tz.sh 
./install_guest_additions.sh
./install_samba.sh
./install_zsh.sh
./install_i3_gaps.sh
./install_slim.sh
./install_vscode.sh
./install_google_chrome.sh
./config_git.sh
./config_alternatives.sh

if [ ! "$1" == "noreboot" ]; then
    reboot
fi
