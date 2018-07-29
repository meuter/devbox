#! /bin/bash -ex

# replace default source.list which does not have universe and multiverse
# by default on ubuntu server
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp ~/.dotfiles/ubuntu/bionic.list /etc/apt/sources.list
sudo apt update
sudo apt upgrade
