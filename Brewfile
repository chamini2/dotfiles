# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils
# Install Bash 4
install bash

# Install wget with IRI support
install wget --enable-iri

# Install more recent versions of some OS X tools
install vim --override-system-vi
tap homebrew/dupes
install homebrew/dupes/grep

# This formula didn’t work well last time I tried it:
#install homebrew/dupes/screen

# Install other useful binaries
install git
install imagemagick
install tree
install rbenv
#install node
#install lynx
#install ack

# https://github.com/rupa/z or cdargs
install z
#install cdargs

# Haskell
install haskell-platform

# Remove outdated versions from the cellar
cleanup
