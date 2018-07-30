#! /bin/bash -ex

# install vanilla devbox
./install_devbox.sh 

# install my pref
./config_autologin.sh
./config_git_cme.sh

# automatically reboot
reboot

