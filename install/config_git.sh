#! /bin/bash -e

source ./colors.sh

info "Configuring GIT..."

# short status
git config --global alias.wtf "status -s"

# pretty log like in gitk
git config --global alias.lol "log --decorate --pretty=oneline --abbrev-commit --color"

# pretty log like in gitk
git config --global alias.lolg "log --graph --decorate --pretty=oneline --abbrev-commit --all --color"

# last 5 commit nicely formatted (when+what+who)
git config --global alias.recent "log -5 --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %C(white)%<(70,trunc)%s%Creset (%cn)'"

# get a list of unpushed commit nicely formatted as in recent
git config --global alias.out "log --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %Cred%<(70,trunc)%s%Creset (%cn)' @{u}.."

# get a list of incoming commits (without merging them in the local workspace), again nicely formatted as in recent
git config --global alias.in "!git remote update -p; git log --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %Cred%<(70,trunc)%s%Creset (%cn)' ..@{u} "

# update = stash + pull --rebase + stash apply
git config --global alias.update "!git stash; git pull --rebase; git stash apply"

# wipe = bring workspace back to HEAD and clean out other files
git config --global alias.wipe "!git reset --hard HEAD; git clean -fd"

# progress = amend commit with latest changes (only tracked files)
git config --global alias.progress "commit -a --amend --reuse-message HEAD"

# undo = undo latest commit
git config --global alias.undo "reset HEAD^1"

# co = checkout 
git config --global alias.co "commit"

# configure meld for diff and difftool
git config --global diff.tool meld
git config --global diff.guitool meld
git config --global diff.prompt false
git config --global difftool.guitool meld
git config --global difftool.prompt false

# git meld as an alias for difftool -d
git config --global alias.meld "difftool -d"

# review incoming changes (without merging them in the local workspace)
git config --global alias.revin "!git remote update -p; git difftool -d @{u}"

# cache credentials
git config --global credential.helper cache

# set vim as the default commit editor, not matter what alternative says
git config --global core.editor "vim"

success "Done!"


