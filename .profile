# Update path.
export PATH=~/bin:~/Dropbox/bin:/usr/local/lib/erlang/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Point wine to the correct folder for it's environment.
export WINEPREFIX=$HOME/.games

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

function t() { 
  TODO_CFG=~/Dropbox/todo/todo.cfg
  if [ $# -eq 0 ]; then
    todo.sh -d $TODO_CFG ls
  else
    todo.sh -d $TODO_CFG $* 
  fi
}


# Set prompt.
PS1="\[\e[1;31m\]\w\[\e[0m\] \[\e[1;32m\]\$(parse_git_branch)\[\e[0m\] \n\[\e[1;37m\]➜\[\e[0m\] "



# SSH Aliases
alias cigroup="ssh nolan@cigroup.crc.nd.edu"
alias citeam="ssh nolan@citeam.crc.nd.edu"
alias projects="ssh nbrubake@projects.crc.nd.edu"

# Misc. aliases
alias c="cd"
alias m="mvim"
alias s="sudo"
alias reload="source ~/.profile"

export PGDATA=/usr/local/var/postgres

# Some clients use the flavor variable to say what environment a project is running in.
export FLAVOR=dev

# Set command line input to vi mode.
set -o vi

# Set control-l to clear the screen.
bind -m vi-insert "\C-l":clear-screen

# Set the editor to vim (so we can be cross platform).
EDITOR="vim"

# JsTestDriver root directory.
JSTESTDRIVER_HOME=~/bin
export JSTESTDRIVER_HOME

# Redis shortcuts
alias startredis="redis-server /usr/local/etc/redis.conf"

export DEV_DIR=~/dev

# Import profile modules
source ~/Configs/lib/git.sh
source ~/Configs/lib/python.sh