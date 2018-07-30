#! /bin/bash -e

source ./colors.sh

info "Installing Visual Studio Code..."
curl --silent https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code libgtk2.0-0 exuberant-ctags cmake ccache
sudo pip install pylint autopep8

info "Installing Visual Studio Code extensions..."
code --install-extension patbenatar.advanced-new-file
code --install-extension ms-vscode.cpptools
code --install-extension twxs.cmake
code --install-extension vector-of-bool.cmake-tools
code --install-extension eamodio.gitlens
code --install-extension bierner.markdown-preview-github-styles
code --install-extension pkief.material-icon-theme
code --install-extension ms-python.python
code --install-extension slevesque.vscode-hexdump
code --install-extension adammaras.overtype

info "Installing devbox Visual Studio Code settings..."
ln -s ~/.devbox/Code/settings.json ~/.config/Code/User/settings.json

success "Done!"

