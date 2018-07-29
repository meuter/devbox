#! /bin/bash -ex

###############################################################################
# 1/ install vanilla i3
###############################################################################

sudo apt install -y i3 rofi feh xinit x11-xserver-utils xclip
mkdir -p .config/i3/

###############################################################################
# 2/ install i3-gaps on top
###############################################################################

# install dependencies
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
                        libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
                        libstartup-notification0-dev libxcb-randr0-dev \
                        libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
                        libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev\
                        autoconf libxcb-xrm0 libxcb-xrm-dev automake

# clone the repository
git clone https://www.github.com/Airblader/i3 /tmp/i3-gaps

# compile & install
cd /tmp/i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install    

# cleanup
cd ~ 
rm -rf /tmp/i3-gaps

###############################################################################
# 3/ install bumblebee-status
###############################################################################

sudo apt install -y python python-netifaces python-psutil

git clone git://github.com/tobi-wan-kenobi/bumblebee-status ~/.config/i3/bumblebee-status

###############################################################################
# 4/ install config symlinks
###############################################################################

if [ -f ~/.config/i3/config ]; then
  mv ~/.config/i3/config ~/.config/i3/config.bak
else
  mkdir -p ~/.config/i3
fi
ln -s ~/.dotfiles/i3/config ~/.config/i3/config


