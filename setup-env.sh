#!/bin/bash

easy_install pip

pip install virtualenv
pip install virtualenvwrapper

# install brew, too.

# Move the Dock to the lower right corner.
default write com.apple.Dock orientation -string right
default write com.apple.Dock pinning end
