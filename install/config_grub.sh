#! /bin/bash -e

source ./colors.sh

info "Removing GRUB timout of 10 sec. for faster boot..."
sudo sed -i -e "s/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=1/" /etc/default/grub
sudo update-grub

success "Done!"

