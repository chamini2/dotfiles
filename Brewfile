# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# This formula didn’t work well last time I tried it:
#install homebrew/dupes/screen

# Install other useful binaries
brew install git
brew install imagemagick
brew install tree
brew install rbenv
#install node
#install lynx
#install ack

# https://github.com/rupa/z or cdargs
brew install z
#install cdargs

# Haskell
brew install haskell-platform

# Remove outdated versions from the cellar
brew cleanup
