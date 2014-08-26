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

# cdargs
function prepare_cdargs() {
    cat ~/.cdargs | sponge "$PWD/.cdargs"

    echo "repos" "`echo ~`/Projects/"    >> "$PWD/.cdargs"
    echo "db"    "`echo ~`/Dropbox/"     >> "$PWD/.cdargs"
    echo "usb"   "`echo ~`/Dropbox/USB/" >> "$PWD/.cdargs"

    sort "$PWD/.cdargs" -u -o "$PWD/.cdargs"
}

function removeIt() {
    rm ~/.aliases
    rm ~/.bash_profile
    rm ~/.bash_prompt
    rm ~/.bashrc
    rm ~/.cdargs
    rm ~/.exports
    rm ~/.functions
    rm ~/.gemrc
    rm ~/.gitconfig
    rm ~/.gitignore
    rm ~/.iftoprc
    rm ~/.inputrc
    rm ~/.wgetrc

    rm ~/.cabal/config
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

    if ! [ -d ~/.cabal ]; then
        mkdir ~/.cabal
    fi
    ln -s "$PWD/cabal-config"   ~/.cabal/config
}

function doIt() {
    prepare_cdargs
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
