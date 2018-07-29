#! /bin/bash -ex

ip=${1:-$(echo "192.168.56.100")}
tz=${2:-$(tzselect)}

./config_tz.sh $tz
./config_sources_list.sh
./install_samba.sh $ip
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

reboot

