#! /bin/bash -ex

sudo sed -i -e "s/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=1/" /etc/default/grub
sudo update-grub

