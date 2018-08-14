#! /bin/bash -e

source ./colors.sh

info "Installing i3-gaps and rofi..."
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
                    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
                    libstartup-notification0-dev libxcb-randr0-dev \
                    libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
                    libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev\
                    autoconf libxcb-xrm0 libxcb-xrm-dev automake numlockx \
		            xclip feh rofi xinit x11-xserver-utils i3\
		            python-psutil lxappearance compton jq

git clone https://www.github.com/Airblader/i3 /tmp/i3-gaps
cd /tmp/i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
rm -rf /tmp/i3gaps

info "Installing bumblebee-status..."
git clone --depth=1 https://github.com/tobi-wan-kenobi/bumblebee-status ~/.config/i3/bumblebee-status

info "Configuring i3..."
ln -s ~/.devbox/i3/config ~/.config/i3/config
echo '#include ".devbox/Xresources/rofi"' >> ~/.Xresources

