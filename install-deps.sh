# up to you (me) if you want to run this as a file or copy paste at your leisure

# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
#sudo bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# homebrew!
# you need the code CLI tools YOU FOOL.
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

# https://github.com/jeroenbegyn/VLCControl
# VLC Controll Script
# cd ~/code
# git clone git://github.com/jeroenbegyn/VLCControl.git

# my magic photobooth symlink -> dropbox. I love it.
# first move Photo Booth folder out of Pictures
# then start Photo Booth. It'll ask where to put the library.
# put it in Dropbox/public
# now you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
# then you grab public URL and send off your video message in a heartbeat.

# Check gems are up to date without installing documentation
# sudo gem update --system --no-document

# Set symlink for Sublime Text
sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/bin/subl
