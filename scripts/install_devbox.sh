#! /bin/bash -ex

tz=${2:-$(tzselect)}
reboot=${3:-reboot}

./config_grub.sh
./config_tz.sh $tz
./config_sources_list.sh
./install_samba.sh
./install_core.sh
./install_guest_additions.sh
./install_i3_gaps.sh
./install_fonts.sh
./install_urxvt.sh
./install_zsh.sh
./install_vscode.sh
./install_google_chrome.sh
./install_slim.sh
./install_arc.sh
./config_git.sh
./config_alternatives.sh

$reboot
