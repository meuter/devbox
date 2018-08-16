# Devbox

This project aims at making it easy to bootstrap my custom development box into
[VirtualBox](https://www.virtualbox.org/wiki/Downloads). The intent here is not
to have a full blown desktop environment, but rather a simple VM that can host a confortable
(at least for me) software development experience (editing, compiling, testing...).
I do mostly C/C++, python, and the occasional javascript and go. Here is a small overview:

| Component        | Choice  | Reason |
| ---------------- | ------- | ------ |
| Distro           | [Ubuntu 18.04.01 server](https://www.ubuntu.com/download/server) | easy to install, well documented, familiar |
| Desktop          | custom fork of [i3](https://github.com/meuter/i3) with [bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status) and custom config | minimalistic, configurable, keyboard based |
| Launcher         | [rofi](https://github.com/DaveDavenport/rofi) | keyboard based, prettier that dmenu |
| Terminal         | [rxvt-unicode](https://wiki.archlinux.org/index.php/rxvt-unicode) with custom config | minimalistic, configurable |
| Dev. Editor (1)  | [Visual Studio Code](https://code.visualstudio.com/) with some custom extensions | user friendly, extensible, multi-language |
| Dev. Editor (2)  | [NeoVIM](https://neovim.io/) with custom [vimrc](https://github.com/meuter/devbox/blob/master/nvim/init.vim) | __not__ user friendly, extensible, multi-language |
| Browser          | [Google Chrome](https://www.google.com/chrome/) | chrome dev tools |
| Shell            | [oh-my-zsh](https://ohmyz.sh/) with [bullet-train](https://github.com/caiogondim/bullet-train.zsh) | theming, improved tab completion over bash |
| Display Manager  | [slim](https://wiki.archlinux.org/index.php/SLiM) with some [custom themes](https://github.com/adi1090x/slim_themes) | tiny footprint, easy to configure |
| File Manager     | [Thunar](https://wiki.archlinux.org/index.php/thunar) | user friendly, familiar |
| Extra            | custom configs, autologin, samba share, fzf | familiar |

Thanks to [Luke Smith](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA) and [Code Path](https://www.youtube.com/channel/UCcQsDUZiK1GWDcP7BpVO_kw) for inspiring this!

# Install

1. install virtual box (tested with v5.2)
2. download Ubuntu 18.04.01 server iso image
3. create a VM:
    1. At least 2Gb Ram
    2. At least 16Gb Disk
    3. Video memory 128Mb    
    4. Two network adatper: 
        1. NAT - guest can go online
        2. Host-Only - host only can connect to guest
    5. load the Ubuntu 18.04.01 server iso in the CDROM drive
4. boot the VM and follow the Ubuntu installer's instruction
    - When configuring the network:
        - select static IP for the second (Host-Only) adapter
        - configure 192.168.56.<whatever> (assuming the VBox Host Network Manager is configured on 192.168.56.xx, which is the default - adapt otherwise)
        - configure netmask 192.168.56.0/24 (same assumption, adapt otherwise)

5. reboot the VM
6. select "devices> install guest additions..." in virtualbox menu to load in the guest addition ISO.
7. clone the project and run the main install script:
    ```
    git clone --depth=1 https://github.com/meuter/devbox ~/.devbox/
    cd ~/.devbox/install/ 
    ./install_dev_box.sh
    ```

   The script will prompt you to enter your password and then proceed with the installation and configuration
   of all the necessary packages. When finished, the VM will reboot automatically at the end.
   
8. Start coding 🤓
9. [optional] if you want to autologin on boot, run the following script:
    ```
    cd ~/.devbox/install/
    ./config_autologin.sh
    ```

# Usage

## i3 Keyboard Shortcut:

| key          | function |
| ------------ | ----- |
| f11 | full screen focussed window |
| ctrl+f11 | toggle status bar visibility |
| alt+\<arrow\> | move focus | 
| alt+shift+\<arrow\> | move window |
| alt+\<num\> | select worspace |
| control+shift+\<arrow\> | select next/prev workspace |
| control+space | select window using rofi |
| alt+space | run command using rofi |
| alt+pause s  | shutdown |
| alt+pause r  | reboot |
| alt+pause e  | logout |
| alt+enter    | open terminal |
| ctrl+shift+g | open chrome |
| ctrl+shift+o | open vscode |
| ctrl+shift+t | open thunar |
| ctrl+alt+c   | edit devbox in vim |
| alt+n | rename current workspace |

## Network:

From the guest machine only, you can ssh into the box. 

```
ssh <user>@<ip>
```

You can also mount your home directory from a Windows host machine. For that, open the file explorer, go to "Computer> Map Network Drive..." and use the following address:

```
\\<ip>\<username>
```

Use your user name and password.

## git alias and shortcuts:

Git is configured with the following git aliase:

| Git Alias | Meaning | Command | Console Alias<sup>(1)</sup> | 
| --------- | ------- | ------- | ------------- |
| diff  | diff against HEAD | diff --no-pager | d |
| wtf   | short status | status -s | w |
| recent | recent change current branch | log -5 --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %C(white)%<(70,trunc)%s%Creset (%cn)' | r | 
| in | incoming commits<sup>(2)</sup> | !git remote update -p; git log --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %Cred%<(70,trunc)%s%Creset (%cn)' ..@{u} | i | 
| out | outgoing commits<sup>(2)</sup> | log --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %Cred%<(70,trunc)%s%Creset (%cn)' @{u}.. | o | 
| lol   | pretty log current branch | log --decorate --pretty=oneline --abbrev-commit --color | l |
| lolg  | pretty log all branches | log --graph --decorate --pretty=oneline --abbrev-commit --all --color | 
| update | update workspace | !git stash; git pull --rebase; git stash pop | 
| wipe | go back to HEAD | !git reset --hard HEAD; git clean -fd | 
| progress | add currently tracked changes to last commit | commit -a --amend --reuse-message HEAD" |
| meld | compare using meld | difftool -d<sup>(3)</sup>
| revin | review incoming changes without merging them | "!git remote update -p; git difftool -d @{u}" |

#### __Notes__:
- __(1)__ you can type this in the terminal instead of "git \<alias\>"
- __(2)__ needs the current branch to track some remote branch
- __(3)__ meld is configured as the default git difftool.

## Screenshots

### Login Screen
![login.jpg](/screenshots/login.jpg?raw=true)

### Empty Desktop
![desktop.jpg](/screenshots/desktop.jpg?raw=true)

### Terminal & NeoVIM
![terminal.jpg](/screenshots/terminal.jpg?raw=true)

### Visual Studio Code & Google Chrome
![code.jpg](/screenshots/code.jpg?raw=true)




