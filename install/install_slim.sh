#! /bin/bash -e

source ./colors.sh


info "Installing slim display manager..."
sudo apt install -y slim

info "Installing slim extra themes..."
git clone --depth=1 https://github.com/adi1090x/slim_themes.git /tmp/slim_themes/
sudo mv /tmp/slim_themes/themes/* /usr/share/slim/themes/

info "Installing devbox slim config..."
sudo cp ~/.devbox/slim/slim.conf /etc/slim.conf

success "Done!"

