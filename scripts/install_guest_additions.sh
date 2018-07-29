#! /bin/bash -ex

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo sh -c "echo 'deb https://download.virtualbox.org/virtualbox/debian/ bionic non-free contrib' > /etc/apt/sources.list.d/virtualbox.list"
sudo apt update
sudo apt install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r) 
sudo apt install -y virtualbox-5.2

sudo mkdir -p /media/additions
sudo mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /media/additions
sudo /media/additions/VBoxLinuxAdditions.run && true
sudo umount /media/additions
sudo rmdir /media/additions

