#! /bin/bash -ex

sudo sh -c "echo # autologin >> /etc/slim.conf"
sudo sh -c "echo default_user   $(whoami) >> /etc/slim.conf"
sudo sh -c "echo auto_login     yes >> /etc/slim.conf"