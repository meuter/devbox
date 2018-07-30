#! /bin/bash -e

source ./colors.sh

# replace default source.list which does not have universe and multiverse
# by default on ubuntu server

info "Updating /etc/apt/sources.list..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp ~/.devbox/ubuntu/bionic.list /etc/apt/sources.list
info "Updating apt database..."
sudo apt update
info "Upgrading packages..."
sudo apt upgrade -y
success "Done!"

