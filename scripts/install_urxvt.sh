#! /bin/bash

# font awesome
sudo apt-get install fonts-font-awesome

# powerline fonts
git clone https://github.com/powerline/fonts.git /tmp/fonts
cd /tmp/fonts
./install.sh
cd ~ 
rm -rf /tmp/fonts

sudo apt-get install rxvt-unicode x11-xserver-utils

echo '#include ".dotfiles/Xresources/colors"' >> ~/.Xresources
echo '#include ".dotfiles/Xresources/rxvt-unicode"' >> ~/.Xresources

xrdb ~/.Xresources