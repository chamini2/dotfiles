# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Set terminal tabs to be 4 spaces long, instead of 8
tabs -4

# Move next only if `homebrew` is installed
# if command -v brew >/dev/null 2>&1; then
# fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Thanks to @tmoitie, adds more tab completion for bash,
# also when hitting tab twice it will show a list.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# Personal autocompletion
export USER_BASH_COMPLETION_DIR=~/.bash_completion.d
if [ -d $USER_BASH_COMPLETION_DIR -a -r $USER_BASH_COMPLETION_DIR -a \
     -x $USER_BASH_COMPLETION_DIR ]; then
        for i in $USER_BASH_COMPLETION_DIR/*; do
                [[ ${i##*/} != @(*~|*.bak|*.swp|\#*\#|*.dpkg*|.rpm*) ]] &&
                        [ \( -f $i -o -h $i \) -a -r $i ] && . $i
        done
fi
unset i

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Bash completion for aliases
alias_completion
