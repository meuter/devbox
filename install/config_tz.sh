#! /bin/bash -e

source ./colors.sh

info "Installing tzupdate..."
sudo pip2 install --user tzupdate

info "Detecting timezone..."
tz=${1:-$(~/.local/bin/tzupdate -p)}

success "Detected '$tz'"

info "Seting up ntp..."
sudo timedatectl set-timezone $tz
sudo timedatectl set-ntp on

info "Cleaning up..."
rm -rf .local

success "Done!"
