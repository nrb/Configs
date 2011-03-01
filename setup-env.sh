#!/bin/bash

easy_install pip

pip install virtualenv
pip install virtualenvwrapper

# install brew, too.

# Move the Dock to the lower right corner.
defaults write com.apple.Dock orientation -string right
defaults write com.apple.Dock pinning end
killall Dock
