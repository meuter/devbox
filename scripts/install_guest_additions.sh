#! /bin/bash -e

source ./colors.sh

info "Installing guest additions..."
sudo mount /dev/cdrom /media/additions
sudo /media/additions/VBoxLinuxAdditions.run || true 
sudo umount /media/additions
sudo rmdir /media/additions
success "Done!"


