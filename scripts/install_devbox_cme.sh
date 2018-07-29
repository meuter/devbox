#! /bin/bash -ex

./install_devbox.sh 192.168.56.105 Europe/Brussels
./config_autologin.sh
./config_git_cme.sh

