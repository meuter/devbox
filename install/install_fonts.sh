#! /bin/bash -e

source ./colors.sh

info "Installing fonts..."
sudo apt install -y fontconfig
pushd .
mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf\?raw\=true -O 'Noto Mono Nerd Font Complete Mono.ttf'
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete.ttf\?raw\=true -O 'Noto Mono Nerd Font Complete.ttf'
fc-cache -fv .
popd

info "Installing infinality font fonfig..."
wget https://launchpad.net/~no1wantdthisname/+archive/ubuntu/ppa/+files/fontconfig-infinality_20130104-0ubuntu0ppa1_all.deb
sudo dpkg -i fontconfig-infinality_20130104-0ubuntu0ppa1_all.deb
# need to patch infinality conf to remove subpixel rendering rgb, messes up with urxvt poweline symbols.
for file in /etc/fonts/infinality/conf.src/50*; do sudo sed -i -e "/rgba/,+2d" $file; done
rm -rf fontconfig-infinality_20130104-0ubuntu0ppa1_all.deb

success "Done!"


