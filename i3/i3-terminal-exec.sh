#! /bin/bash

term=$(readlink -f /usr/bin/x-terminal-emulator)

if (( $# < 2 )); then
    echo "Usage: $0 <working directory> <cmd> [args]"
    exit -1;
fi

if [ "$term" == "/usr/bin/lxterminal" ]; then
    /usr/bin/lxterminal --working-directory=$1 --command="${@:2}"
elif [ "$term" == "/usr/bin/xfce4-terminal.wrapper" ]; then
    /usr/bin/xfce4-terminal --working-directory=$1 --command="${@:2}"
elif [ "$term" == "/usr/bin/urxvt" ]; then
    /usr/bin/urxvt -cd $1 -e ${@:2}
else
   cd $1 && xterm -e "${@:2}" 
fi

