#! /bin/bash -e

source ./colors.sh

info "Installing zsh..."
sudo pacman -S zsh wget

info "Setting zsh as default shell for $(whoami)..."
sudo usermod -s $(which zsh) $(whoami)

info "Installing oh-my-zsh..."
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.config/oh-my-zsh/

info "Installing bullet-train theme..."
wget --quiet http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -P ~/.config/oh-my-zsh/themes/

info "Installing devbox .zsh..."
ln -s ~/.devbox/zsh/zshrc ~/.zshrc

info "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

success "Done!"
