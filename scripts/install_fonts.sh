#! /bin/bash

# font awesome
sudo apt-get install fonts-font-awesome

# powerline fonts
git clone https://github.com/powerline/fonts.git /tmp/fonts
cd /tmp/fonts
./install.sh
cd ~ 
rm -rf /tmp/fonts