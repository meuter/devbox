#! /bin/bash -ex

sudo apt install -y ifupdown samba

sudo smbpasswd -a $(whoami)
sudo cp ~/.devbox/network/interfaces /etc/network/
sudo cp ~/.devbox/samba/smb.conf /etc/samba/

default="192.168.56.100"
ip=${1:-$default}
sudo sed -i "s/$default/$ip/" /etc/network/interfaces