#! /bin/bash -ex

noreboot=""

./install_devbox.sh Europe/Brussels $noreboot
./config_autologin.sh
./config_git_cme.sh

reboot

