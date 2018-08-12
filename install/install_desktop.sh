#! /bin/bash -e

source ./colors.sh

info "Installing Desktop..."

./install_fonts.sh
./install_i3.sh
./install_lxterminal.sh
#./install_urxvt.sh
#./install_xfceterminal.sh

success "Done!"

