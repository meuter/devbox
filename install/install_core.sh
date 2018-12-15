#! /bin/bash -e

source ./colors.sh

info "Installing core packages..."
sudo pacman --noconfirm -S gcc make linux-headers wget curl python2 python2-pip\
	                   python2-virtualenv

success "Done!"

