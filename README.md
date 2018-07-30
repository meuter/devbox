# Devbox

This project aims at making it easy to bootstrap my custom development box into
[VirtualBox](https://www.virtualbox.org/wiki/Downloads). The intent here is not
to have a full blown desktop environment, but rather a simple VM that can host a confortable
(at least for me) software development experience (editing, compiling, testing...).
I do mostly C/C++, python, and the occasional javascript and go. Here is a small overview:

| Component        | Choice  | Reason |
| ---------------- | ------- | ------ |
| Distro           | [Ubuntu 18.04.01 server](https://www.ubuntu.com/download/server) | easy to install, well documented, familiar |
| Desktop          | [i3-gaps](https://github.com/Airblader/i3) with [bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status) and custom config | minimalistic, configurable, keyboard based |
| Launcher         | [rofi](https://github.com/DaveDavenport/rofi) | keyboard based, prettier that dmenu |
| Terminal         | [rxvt-unicode](https://wiki.archlinux.org/index.php/rxvt-unicode) with custom config | minimalistic, configurable |
| Dev. Editor      | [Visual Studio Code](https://code.visualstudio.com/) with some custom extensions | user friendly, extensible, multi-language, *not* vim 😂|
| Browser          | [Google Chrome](https://www.google.com/chrome/) | chrome dev tools |
| Shell            | [oh-my-zsh](https://ohmyz.sh/) with [bullet-train](https://github.com/caiogondim/bullet-train.zsh) | theming, improved tab completion over bash |
| Display Manager  | [slim](https://wiki.archlinux.org/index.php/SLiM) with some [custom themes](https://github.com/adi1090x/slim_themes) | tiny footprint, easy to configure |
| File Manager     | [Thunar](https://wiki.archlinux.org/index.php/thunar) | user friendly, familiar |
| GTK Theme        | [Arc-Dark](https://github.com/horst3180/arc-theme) | pretty |
| Extra            | custom configs, autologin, samba share | familiar |

Thanks to [Luke Smith](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA) and [Code Path](https://www.youtube.com/channel/UCcQsDUZiK1GWDcP7BpVO_kw) for inspiring this!

# Install

1. install virtual box > 5.2
2. download Ubuntu 18.04.01 server iso image
3. create a VM:
    1. At least 2Gb Ram
    2. At least 16Gb Disk
    3. Video memory 128Mb    
    4. Two network adatper: 
        1. NAT - guest can go online
        2. Host-Only (192.168.56.xx) - host only can connect to guest
5. run main install script and follow instruction
    ```
    git clone --depth=1 https://github.com/meuter/devbox ~/.devbox/
    cd ~/.devbox/scripts/ 
    ./install_dev_box.sh
    ```

   The script will ask you to select the timezone, and a little later, configure your
   samba password (to share your home over samba in the guest). The install will then
   continue until completion without user interaction. It will automatically reboot
   at the end.
    
# Usage

## i3 Keyboard Shortcut:

| key          | function |
| ------------ | ----- |
| alt+pause s  | shutdown |
| alt+pause r  | reboot |
| alt+pause e  | logout |
| alt+enter    | open terminal |
| ctrl+shift+g | open chrome |
| ctrl+shift+o | open vscode |
| ctrl+shift+o | open thunar |
| ctrl+alt+c   | edit devbox |

## SSH into the box:

```
ssh 192.168.56.100
```

## Mounting home to windows host:

In Windows Explorer, go to "Computer> Map Network Drive..." and use the following address:

```
\\192.168.1.100\<username>
```
## Screenshots

### Login Screen
![screenshot0.jpg](/screenshots/screenshot0.jpg?raw=true)

### Empty desktop
![screenshot1.jpg](/screenshots/screenshot1.jpg?raw=true)

### Some applications open
![screenshot2.jpg](/screenshots/screenshot2.jpg?raw=true)

