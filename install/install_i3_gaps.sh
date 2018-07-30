#! /bin/bash -e

source ./colors.sh

info "Installing i3, rofi, rxvt-unicode & i3-gaps dependencies..."
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
                    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
                    libstartup-notification0-dev libxcb-randr0-dev \
                    libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
                    libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev\
                    autoconf libxcb-xrm0 libxcb-xrm-dev automake numlockx \
		            xclip feh rofi xinit x11-xserver-utils rxvt-unicode i3\
		            fonts-font-awesome python-psutil lxappearance

info "Installing i3-gaps on top..."
git clone https://www.github.com/Airblader/i3 /tmp/i3-gaps
cd /tmp/i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make 
sudo make install


info "Installing powerline fonts..."
git clone --depth=1 https://github.com/powerline/fonts.git /tmp/fonts
cd /tmp/fonts
./install.sh

info "Installing bumblebee-status..."
git clone --depth=1 git://github.com/tobi-wan-kenobi/bumblebee-status ~/.config/i3/bumblebee-status

info "Installing devbox i3 config..."
ln -s ~/.devbox/i3/config ~/.config/i3/config

info "Installing devbox .Xresources..."
echo '#include ".devbox/Xresources/rofi"' >> ~/.Xresources
echo '#include ".devbox/Xresources/colors"' >> ~/.Xresources
echo '#include ".devbox/Xresources/rxvt-unicode"' >> ~/.Xresources

info "Configuring uxrvt as default terminal..."
sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt

info "Cleanup..."
cd ~ 
rm -rf /tmp/i3-gaps
rm -rf /tmp/fonts

success "Done!"

