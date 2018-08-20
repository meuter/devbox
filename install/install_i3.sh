#! /bin/bash -e

source ./colors.sh

info "Installing i3 and rofi..."
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
                    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
                    libstartup-notification0-dev libxcb-randr0-dev \
                    libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
                    libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev\
                    autoconf libxcb-xrm0 libxcb-xrm-dev automake numlockx \
		            xclip feh rofi xinit x11-xserver-utils i3 xdotool\
		            python-psutil lxappearance compton jq zenity

# install my fork of i3 without the 1px border around the status bar
git clone https://github.com/meuter/i3 /tmp/i3
cd /tmp/i3
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make -j8
sudo make install
rm -rf /tmp/i3
cd ~/

info "Installing bumblebee-status..."
git clone --depth=1 https://github.com/tobi-wan-kenobi/bumblebee-status ~/.config/i3/bumblebee-status

info "Configuring i3..."
ln -s ~/.devbox/i3/config ~/.config/i3/config
ln -s ~/.devbox/bumblebee-theme/greyish.json ~/.config/i3/bumblebee-status/themes/
ln -s ~/.devbox/bumblebee-theme/awesome-fonts-square.json ~/.config/i3/bumblebee-status/themes/icons/
echo '#include ".devbox/Xresources/rofi"' >> ~/.Xresources

# allow i3 to shutdown/reboot the machine
sudo cp ~/.devbox/polkit/org.freedesktop.login1.policy /usr/share/polkit-1/actions/

