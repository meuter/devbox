# Custom Ubuntu Flavor:

| Component        | Choice|
| ---------------- | ----- | 
| Distro           | Ubuntu 18.04.01 server |
| Desktop          | i3-gaps+rofi |
| Terminal         | rxvt-unicode |
| Dev. Editor      | vscode |
| Browser          | google chrome |
| Shell            | zsh+oh-my-zsh+bullet-train |
| Display Manager  | slim |
| Theme            | Arc-Dark |
| Sharing | homes via samba |
| Extra            | custom configs, autologin |


# Install

1. install virtual box > 5.2
2. download Ubuntu 18.04.01 server iso image
3. create a VM:
    1. At least 2Gb Ram
    2. At least 16Gb Disk
    3. Video memory 128Mb    
    4. Two network adatper: 
        1. NAT
        2. Host-Only (192.168.56.xx) - for home sharng and ssh access
5. run main install script:
    ```
    git clone https://github.com/meuter/dotfiles ~/.dotfiles/
    cd ~/.dotfiles/scripts/install_vm_bionic.sh
    ```
   The script will prompt for the timezone at the begining, and the smb password at the end 
6. let it reboot
7. from Windows host connect to in exporer:

    ```
    "\\192.168.1.100\<username>"
    ```

