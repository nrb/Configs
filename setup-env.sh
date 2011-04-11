#!/bin/bash

easy_install pip

pip install virtualenv
pip install virtualenvwrapper

# Move the Dock to the lower right corner.
defaults write com.apple.Dock orientation -string right
defaults write com.apple.Dock pinning end
killall Dock

ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)"

brew install git
brew install macvim

mkdir ~/.ssh
ssh-keygen
