#! /bin/bash -ex

# font awesome
sudo apt install -y fonts-font-awesome

# powerline fonts
git clone --depth=1 https://github.com/powerline/fonts.git /tmp/fonts
cd /tmp/fonts
./install.sh
cd ~ 
rm -rf /tmp/fonts
