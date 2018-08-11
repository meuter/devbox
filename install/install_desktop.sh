#! /bin/bash -e

source ./colors.sh

info "Installing Desktop..."
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
                    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
                    libstartup-notification0-dev libxcb-randr0-dev \
                    libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
                    libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev\
                    autoconf libxcb-xrm0 libxcb-xrm-dev automake numlockx \
		            xclip feh rofi xinit x11-xserver-utils i3\
		            python-psutil lxappearance xfce4-terminal

git clone https://www.github.com/Airblader/i3 /tmp/i3-gaps
cd /tmp/i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
rm -rf /tmp/i3gaps

info "Installing fonts..."
pushd .
mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf\?raw\=true -O 'Noto Mono Nerd Font Complete Mono.ttf'
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete.ttf\?raw\=true -O 'Noto Mono Nerd Font Complete.ttf'
fc-cache -fv .
popd

info "Configuring Desktop..."
git clone --depth=1 https://github.com/tobi-wan-kenobi/bumblebee-status ~/.config/i3/bumblebee-status
ln -s ~/.devbox/i3/config ~/.config/i3/config
echo '#include ".devbox/Xresources/rofi"' >> ~/.Xresources
sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper
ln -s ~/.devbox/xfce4 ~/.config

success "Done!"

