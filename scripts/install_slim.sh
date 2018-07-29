#! /bin/bash -e

# install slim
sudo apt install -y slim

# install additional themes
git clone https://github.com/adi1090x/slim_themes.git /tmp/slim_themes/
sudo mv /tmp/slim_themes/themes/* /usr/share/slim/themes/

# symlink to config file
if [ -f /etc/slim.conf ]; then
  sudo mv /etc/slim.conf /etc/slim.conf.bak
ln -s ~/.dotfiles/slim/slim.conf /etc/slim.conf
nf
sudo sh -e "echo '# autologin' >> /etc/slim.conf"
sudo sh -e "echo 'default_user $(whoami)' >> /etc/slim.conf"
sudo sh -e "echo 'autologin yes' >> /etc/slim.conf"








