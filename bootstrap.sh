#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function moveIt() {
    cp "$PWD/.aliases"      ~/.aliases
    cp "$PWD/.bash_profile" ~/.bash_profile
    cp "$PWD/.bash_prompt"  ~/.bash_prompt
    cp "$PWD/.bashrc"       ~/.bashrc
    cp "$PWD/.cdargs"       ~/.cdargs
    cp "$PWD/.exports"      ~/.exports
    cp "$PWD/.functions"    ~/.functions
    cp "$PWD/.gemrc"        ~/.gemrc
    cp "$PWD/.gitconfig"    ~/.gitconfig
    cp "$PWD/.gitignore"    ~/.gitignore
    cp "$PWD/.iftoprc"      ~/.iftoprc
    cp "$PWD/.inputrc"      ~/.inputrc
    cp "$PWD/.wgetrc"       ~/.wgetrc

    mkdir ~/.cabal
    cp "$PWD/cabalconfig"   ~/.cabal/config

    source ~/.bash_profile
}

function removeIt() {
    rm ~/.aliases ~/.bash_profile ~/.bash_prompt ~/.bashrc ~/.exports\
        ~/.functions ~/.gemrc ~/.gitconfig ~/.gitignore ~/.iftoprc\
        ~/.inputrc ~/.wgetrc ~/.cabal/config
}

function linkIt() {
    ln -s "$PWD/.aliases"      ~/.aliases
    ln -s "$PWD/.bash_profile" ~/.bash_profile
    ln -s "$PWD/.bash_prompt"  ~/.bash_prompt
    ln -s "$PWD/.bashrc"       ~/.bashrc
    ln -s "$PWD/.cdargs"       ~/.cdargs
    ln -s "$PWD/.exports"      ~/.exports
    ln -s "$PWD/.functions"    ~/.functions
    ln -s "$PWD/.gemrc"        ~/.gemrc
    ln -s "$PWD/.gitignore"    ~/.gitignore
    ln -s "$PWD/.iftoprc"      ~/.iftoprc
    ln -s "$PWD/.inputrc"      ~/.inputrc
    ln -s "$PWD/.wgetrc"       ~/.wgetrc
    cp    "$PWD/.gitconfig"    ~/.gitconfig   # We don't want to put email and name in the repo
    
    mkdir ~/.cabal
    ln -s "$PWD/cabalconfig"   ~/.cabal/config

}

function doIt() {
	removeIt
	linkIt
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
