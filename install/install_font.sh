#! /bin/bash -e

source ./colors.sh

info "Installing fonts..."
pushd .
mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf\?raw\=true -O 'Noto Mono Nerd Font Complete Mono.ttf'
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete.ttf\?raw\=true -O 'Noto Mono Nerd Font Complete.ttf'
fc-cache -fv .
popd

success "Done!"


