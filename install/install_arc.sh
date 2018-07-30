#! /bin/bash -ex

sudo apt install -y arc-theme xubuntu-icon-theme thunar lxappearance

# update gtk settings simlink
if [ -f ~/.config/gtk-3.0/settings.ini ]; then
  mv ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.bak
else
  mkdir -p ~/.config/gtk-3.0/
fi
cp ~/.devbox/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
