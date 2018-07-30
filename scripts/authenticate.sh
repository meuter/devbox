# !/bin/bash -e

source ./colors.sh

info "Authenticating..."

# forget current sudo session
sudo -k

# ask for password
input -n "Password for $(whoami): "
read -s password

# check password and authenticate
if (echo $password; echo "") | sudo -S echo "" &> /dev/null; then
	echo ""
	success "Authentication successful!"
else 
	error "Wrong password, retry..."
fi

# export password for ./install_samba.sh later
export password
