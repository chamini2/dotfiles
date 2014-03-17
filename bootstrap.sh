#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function moveIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
    source ~/.bash_profile
}

function removeIt() {
    rm ~/.aliases ~/.bash_profile ~/.bash_prompt ~/.bashrc ~/.exports\
        ~/.functions ~/.gemrc ~/.gitconfig ~/.gitignore ~/.iftoprc ~/.inputrc ~/.wgetrc
}

function linkIt() {
    ln -s .aliases      ~/.aliases
    ln -s .bash_profile ~/.bash_profile
    ln -s .bash_prompt  ~/.bash_prompt
    ln -s .bashrc       ~/.bashrc
    ln -s .exports      ~/.exports
    ln -s .functions    ~/.functions
    ln -s .gemrc        ~/.gemrc
    ln -s .gitconfig    ~/.gitconfig
    ln -s .gitignore    ~/.gitignore
    ln -s .iftoprc      ~/.iftoprc
    ln -s .inputrc      ~/.inputrc
    ln -s .wgetrc       ~/.wgetrc
}

function doIt() {
	removeIt
	
	if [ git rev-parse --is-inside-git-dir 2> /dev/null ]; then
		linkIt
	else
		moveIt
	fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset moveIt
unset linkIt
unset removeIt
unset doIt
