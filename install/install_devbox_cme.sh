#! /bin/bash -ex

./install_devbox.sh noreboot
#./config_autologin.sh
./config_git_cme.sh

sudo reboot

