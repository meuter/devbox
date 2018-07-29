#! /bin/bash -e

sudo apt install arc-theme xubuntu-icon-theme thunar

# update gtk settings simlink
if [ -f ~/.config/gtk-3.0/settings.ini ]; then
  cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.bak
  rm -f ~/.config/gtk-3.0/settings.ini
fi
ln -s ~/.dotfiles/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini