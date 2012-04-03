# Update path.
export PATH=~/bin:~/.rvm/gems/ruby-1.9.2-p290/bin:~/Dropbox/bin:/usr/local/lib/erlang/bin:/usr/local/bin:/usr/local/sbin:$PATH

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

# Move to the project specified, or just go to the development dir.
function d() {
    if [ -d ~/dev/$1 ]; then
        cd ~/dev/$1
    else
        cd ~/dev
    fi
}

# Completion for projects in the ~/dev directory.
_d() {
    local cur prev opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    local dirs=$(ls ~/dev);
    COMPREPLY=( $(compgen -W "${dirs}" -- ${cur}) )
    return 0
}

complete -F _d d

function fuckitdude() {
    echo "Let's go bowling."
}

function t() { 
  TODO_CFG=~/Dropbox/todo/todo.cfg
  if [ $# -eq 0 ]; then
    todo.sh -d $TODO_CFG ls
  else
    todo.sh -d $TODO_CFG $* 
  fi
}

function reload() {
  # Stash the name of the virtualenv we're working on if it exists.
  if [ -n "$VIRTUAL_ENV" ]
  then
    working_on=`basename $VIRTUAL_ENV`
  fi
  
  # Reload the profile
  source ~/.profile
  
  # Reload the virtualenv, if there was one.
  if [ -n "$working_on" ]
  then
    # Tell the postactivate script to not change directory back to the virtual_env
    no_cd="true"
    workon $working_on
  fi
}


# Misc. aliases
alias c="cd"
alias m="mvim -v"
alias mg="mvim"
alias tm="tmux -2"
alias s="sudo"
alias ls="ls -F" # With type symbols
alias ll="ls -alh" # Long output with human readable sizes.

# Recursively build tags for the current directory.
alias mktags="/usr/local/bin/ctags -R *"

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

# bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
source `brew --prefix`/etc/bash_completion
fi

# Import profile modules
source ~/Configs/lib/git.sh
source ~/Configs/lib/python.sh
source ~/Configs/lib/ruby.sh

# Set prompt.
PS1="\[\e[1;31m\]\w\[\e[0m\]\[\e[1;32m\] \$(vcprompt) \[\e[0m\] \n\[\e[1;32m\]➜\[\e[0m\] "
