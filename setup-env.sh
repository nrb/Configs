#!/bin/bash

easy_install pip

pip install virtualenv
pip install virtualenvwrapper
pip install PIL


# Move the Dock to the lower right corner.
defaults write com.apple.Dock orientation -string right
defaults write com.apple.Dock pinning end
killall Dock

# Install homebrew
ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)"

# Get the latest versions of necessary software.
brew install git
brew install macvim
brew install postgres

# Update vim modules.
mkdir -p .vim/bundles
ruby .vim/update_bundles

# Set up python virtual envs, and create the VIM one.
mkdir -p ~/.envs
mkvirtualenv vim
pip install pyflakes -E ~/.envs/vim/

# Set up SSH keys.
mkdir ~/.ssh
ssh-keygen
