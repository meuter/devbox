#! /bin/bash -ex

sudo apt install -y samba

sudo smbpasswd -a $(whoami)
sudo cp ~/.devbox/samba/smb.conf /etc/samba/

