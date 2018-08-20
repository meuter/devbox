#! /bin/bash

source colors.sh

info "Configuring GTK theme..."

mkdir -p ~/.config/gtk-3.0
ln -s ~/.devbox/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
