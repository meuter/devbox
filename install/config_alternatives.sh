#! /bin/bash -ex

sudo apt install -y neofetch meld clang vim ccache cmake

sudo update-alternatives --set editor /usr/bin/vim.basic
sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt
sudo update-alternatives --set c++ /usr/bin/clang++
sudo update-alternatives --set c89 /usr/bin/clang
sudo update-alternatives --set c99 /usr/bin/clang
sudo update-alternatives --set cc /usr/bin/clang

