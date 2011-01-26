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

# Set prompt.
PS1="\w \$(parse_git_branch)\$ "

# Git aliases
alias gscl="git svn clone"
alias gsdc="git svn dcommit"
alias gc="git commit"
alias gcm="git commit -m"
alias ga="git add"
alias gst="git status"
alias gd="git diff"

# SSH Aliases
alias cigroup="ssh nolan@cigroup.crc.nd.edu"
alias citeam="ssh nolan@citeam.crc.nd.edu"
alias projects="ssh nrb@projects.crc.nd.edu"

# Misc. aliases
alias c="cd"
alias m="mate"
alias s="sudo"
alias reload="source ~/.profile"

# Python aliases
alias py="python"
## Virtualenv aliases
alias venv="virtualenv"
alias venv-nsp="virtualenv --no-site-packages"
alias act="bin/activate"
alias dact="deactivate"