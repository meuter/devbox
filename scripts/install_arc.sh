#! /bin/bash -e

sudo apt install arc-theme xubuntu-icon-theme thunar

# update gtk settings simlink
if [ -f ~/.config/gtk-3.0/settings.ini ]; then
  mv ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.bak
else
  mkdir -p ~/.config/gtk-3.0/
fi
ln -s ~/.dotfiles/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini