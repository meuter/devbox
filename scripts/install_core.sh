#! /bin/bash -e

source ./colors.sh

info "Installing core packages..."
sudo apt install -y build-essential neofetch vim python python-pip \
	            dkms linux-headers-generic linux-headers-$(uname -r)
success "Done!"


