#! /bin/bash -e

source ./colors.sh

info "Installing URxvt..."
sudo apt install -y rxvt-unicode-256color

info "Configuring URxvt..."
sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt

add_to_xresource() {
    file=$1
    if grep $file ~/.Xresources &> /dev/null; then
        success "$file already included..."
    else
        echo \#include \"$file\" >> ~/.Xresources
    fi
}

add_to_xresource .devbox/Xresources/rxvt-unicode
add_to_xresource .devbox/Xresources/colors

success "Done!"
