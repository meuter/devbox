#! /bin/bash -ex

noreboot=""

./install_devbox.sh 192.168.56.105 Europe/Brussels $noreboot
./config_autologin.sh
./config_git_cme.sh

reboot

