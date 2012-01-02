# Config management aliases
alias pushconfig="git push origin"

# Git aliases
alias gscl="git svn clone -s"
alias gsdc="git svn dcommit"
alias gc="git commit -v"
alias gcm="git commit -m"
alias ga="git add"
alias gst="git status"
alias gd="git diff"
alias gi="git svn init -s"

# Git configuration
git config --global core.editor vim
git config --global color.ui true
git config --global merge.tool vimdiff

# Git functions

function git_merge_to_master() {
    # Retrieve the current git branch name, checkout master, and merge this one into it.
    current_branch=$(parse_git_branch)
    git checkout master
    git merge $current_branch --no-ff
}