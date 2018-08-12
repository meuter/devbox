#! /bin/bash -e

source ./colors.sh

info "Installing LXTerminal..."
sudo apt install -y lxterminal

info "Configuring LXTerminal..."
sudo update-alternatives --set x-terminal-emulator /usr/bin/lxterminal

if [ "$(readlink -f ~/.config/lxterminal/lxterminal.conf)" = "/home/$(whoami)/.devbox/lxterminal/lxterminal.conf" ]; then
    info "Already configured..."
else
    mkdir -p ~/.config/lxterminal/
    ln -sv ~/.devbox/lxterminal/lxterminal.conf ~/.config/lxterminal
fi

success "Done!"
