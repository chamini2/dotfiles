# 'ls' con color en la salida
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# long history
HISTFILESIZE=1000000000
HISTSIZE=1000000

# history search with up and down
bind '"[A":history-search-backward'
bind '"[B":history-search-forward'

# GCC bueno
# alias gcc='gcc-4.2'

# ls mejorado, todos y solo directorios
alias la='ls -a'
alias ll='ls -d */'

# Sublime Text 3
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
export EDITOR=subl

# cdargs
source /usr/local/Cellar/cdargs/1.35/contrib/cdargs-bash.sh

# Para paquetes de Haskell
PATH="$HOME/Library/Haskell/bin:${PATH}"
PATH="$HOME/.cabal/bin:${PATH}"

# Path de Cellar
PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

# Path de todo
PATH="/usr/bin:/bin:/sbin:${PATH}"

# Setting PATH for Python 3.3
PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"

# PATH for rbenv
PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:${PATH}"
eval "$(rbenv init -)"

# PATH for MySQL
PATH="/usr/local/mysql/bin:${PATH}"

export PATH
