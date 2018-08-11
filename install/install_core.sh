#! /bin/bash -e

source ./colors.sh

info "Installing core packages..."
sudo apt install -y build-essential neofetch python python-pip curl\
	            dkms linux-headers-generic linux-headers-$(uname -r)

info "Removing some bloatware..."
sudo apt purge -y snapd ubuntu-core-launcher squashfs-tools\
                  lxde-settings-daemon nano unattended-upgrades\

success "Done!"

