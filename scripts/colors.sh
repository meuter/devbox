#! /bin/bash -e

export RESTORE=$(echo -en '\033[0m')
export RED=$(echo -en '\033[00;31m')
export GREEN=$(echo -en '\033[00;32m')
export YELLOW=$(echo -en '\033[00;33m')
export BLUE=$(echo -en '\033[00;34m')
export MAGENTA=$(echo -en '\033[00;35m')
export PURPLE=$(echo -en '\033[00;35m')
export CYAN=$(echo -en '\033[00;36m')
export LIGHTGRAY=$(echo -en '\033[00;37m')
export LRED=$(echo -en '\033[01;31m')
export LGREEN=$(echo -en '\033[01;32m')
export LYELLOW=$(echo -en '\033[01;33m')
export LBLUE=$(echo -en '\033[01;34m')
export LMAGENTA=$(echo -en '\033[01;35m')
export LPURPLE=$(echo -en '\033[01;35m')
export LCYAN=$(echo -en '\033[01;36m')
export WHITE=$(echo -en '\033[01;37m')

info() {
	echo -n "${CYAN}INFO  >> "
	echo $@
	echo -n ${RESTORE}
}

error() {
	echo -n "${RED}ERROR >> "
	echo $@
	echo -n ${RESTORE}
}

input() {
	echo -n "${YELLOW}INPUT >> "
	echo $@
	echo -n ${RESTORE}
}

success() {
	echo -n "${GREEN}OK    >> "
	echo $@
	echo -n ${RESTORE}
}

export -f info
export -f success
export -f error
export -f input

