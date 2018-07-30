#! /bin/bash -ex

sudo smbpasswd -x $(whoami) || true
rm -rf ~/.local/
rm -rf ~/.config/oh-my-zsh 
rm -rf ~/.zshrc
rm -rf ~/.config/i3/config
rm -rf ~/.Xresources
rm -rf ~/.config/i3/bumblebee-status
rm -rf /tmp/i3-gaps
rm -rf /tmp/fonts
rm -rf ~/.config/Code/User/settings.json
sudo rm -rf /etc/i3
sudo rm -rf /etc/slim.conf
