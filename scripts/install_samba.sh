#! /bin/bash -e

source ./colors.sh

info "Installing samba..."
sudo apt install -y samba

info "Creating samba user account for $(whoami)..."
sudo sh -c "(echo $password; echo $password) | smbpasswd -s -a $(whoami)"

info "Configuring samba to share home dir..."
sudo cp ~/.devbox/samba/smb.conf /etc/samba/

success "Done!"

