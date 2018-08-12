#! /bin/bash -e

source ./colors.sh

info "Installing XFCE Terminal..."
sudo apt install -y xfce4-terminal

info "Configuring XFCE Terminal..."
sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper

if [ "$(readlink -f ~/.config/xfce4/terminal)" = "/home/$(whoami)/.devbox/xfce4/terminal" ]; then
    info "Already configured..."
else
    mkdir -p ~/.config/xfce4/
    ln -sv ~/.devbox/xfce4/terminal ~/.config/xfce4/terminal
fi

success "Done!"
