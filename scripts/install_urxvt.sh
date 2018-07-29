#! /bin/bash -e

sudo apt install -y rxvt-unicode x11-xserver-utils

echo '#include ".dotfiles/Xresources/colors"' >> ~/.Xresources
echo '#include ".dotfiles/Xresources/rxvt-unicode"' >> ~/.Xresources

xrdb ~/.Xresources