# Update path.
export PATH=/usr/local/lib/erlang/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Get current git branch.
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# Do a find and replace for a particular string across files.
function mutlireplace {
    # TODO: look up how to do bash args.
    find . -type f -exec sed -i '' 's/run_job/init_job/g' {} \;
}

# Updates the configs directory to the latest version.
function update-configs {
    cd ~/Configs
    git pull origin
}


# Set prompt.
PS1="\[\e[1;31m\]\w\[\e[0m\] \[\e[1;32m\]\$(parse_git_branch)\[\e[0m\] \n\! \[\e[1;37m\]➜\[\e[0m\] "

# Config management aliases
alias pushconfig="git push origin"

# Git aliases
alias gscl="git svn clone -s"
alias gsdc="git svn dcommit"
alias gc="git commit"
alias gcm="git commit -m"
alias ga="git add"
alias gst="git status"
alias gd="git diff"
alias gi="git svn init -s"

# SSH Aliases
alias cigroup="ssh nolan@cigroup.crc.nd.edu"
alias citeam="ssh nolan@citeam.crc.nd.edu"
alias projects="ssh nrb@projects.crc.nd.edu"

# Misc. aliases
alias c="cd"
alias m="mvim"
alias s="sudo"
alias reload="source ~/.profile"

# Python aliases
alias py="python"
## Virtualenv aliases
alias venv="virtualenv"
alias venv-nsp="virtualenv --no-site-packages"
alias act="source bin/activate"
alias dact="deactivate"

alias pinprojlist="pinax-admin clone_project -l"
alias pinclone="pinax-admin clone_project"

# Make sure to install the virtualenvwrapper script.
source /usr/local/bin/virtualenvwrapper.sh

# Set up the virtualenvwrapper project root.
WORKON_HOME=~/dev

# Set command line input to vi mode.
set -o vi

# Set control-l to clear the screen.
bind -m vi-insert "\C-l":clear-screen

# Set the editor to vim (so we can be cross platform).
EDITOR="vim"
