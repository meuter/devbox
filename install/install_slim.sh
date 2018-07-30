#! /bin/bash -exx

# install slim
sudo apt install -y slim

# install additional themes
git clone --depth=1 https://github.com/adi1090x/slim_themes.git /tmp/slim_themes/
sudo mv /tmp/slim_themes/themes/* /usr/share/slim/themes/

# symlink to config file
if [ -f /etc/slim.conf ]; then
  sudo mv /etc/slim.conf /etc/slim.conf.bak
fi

sudo cp ~/.devbox/slim/slim.conf /etc/slim.conf

