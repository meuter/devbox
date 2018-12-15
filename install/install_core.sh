#! /bin/bash -e

source ./colors.sh

info "Installing core packages..."
sudo pacman --noconfirm -S gcc make linux-headers wget curl
#sudo apt install -y build-essential cmake neofetch python python-pip curl\
#	            dkms linux-headers-generic linux-headers-$(uname -r)


success "Done!"

