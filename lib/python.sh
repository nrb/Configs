# Python aliases
alias py="python"

# Pinax aliases
alias pinprojlist="pinax-admin clone_project -l"
alias pinclone="pinax-admin clone_project"

# Django shortcuts
alias drs="clear; ./manage.py runserver"


# -- Virtualenv settings
# Make sure to install the virtualenvwrapper script.
if [ -e /usr/local/bin/virtualenvwrapper.sh ]
then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -e  ~/.pythonbrew/etc/bashrc ]
then
    source ~/.pythonbrew/etc/bashrc
fi

# Virtualenv aliases
alias venv="virtualenv"
alias venv-nsp="virtualenv --no-site-packages"
alias act="source bin/activate"
alias dact="deactivate"

# Set up the virtualenvwrapper project root.
WORKON_HOME=~/.envs

# Set up the virtualenvwrapper hooks directory
VIRTUALENVWRAPPER_HOOK_DIR=~/Configs/virtualenvwrapper