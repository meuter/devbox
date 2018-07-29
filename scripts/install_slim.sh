#! /bin/bash -exx

# install slim
sudo apt install -y slim

# install additional themes
git clone https://github.com/adi1090x/slim_themes.git /tmp/slim_themes/
sudo mv /tmp/slim_themes/themes/* /usr/share/slim/themes/

# symlink to config file
if [ -f /etc/slim.conf ]; then
  sudo mv /etc/slim.conf /etc/slim.conf.bak
fi

echo '\# autologin' >> ~/.dotfiles/slim/slim.conf
echo 'default_user $(whoami)' >> ~/.dotfiles/slim/slim.conf
echo 'autologin yes' >> ~/.dotfiles/slim/slim.conf
ln -s ~/.dotfiles/slim/slim.conf /etc/slim.conf