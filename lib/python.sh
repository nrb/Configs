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

# Stolen from the django/extras directory.
_django_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
	               DJANGO_AUTO_COMPLETE=1 $1 ) )
}
complete -F _django_completion -o default django-admin.py manage.py django-admin

_python_django_completion()
{
    if [[ ${COMP_CWORD} -ge 2 ]]; then
        PYTHON_EXE=$( basename -- ${COMP_WORDS[0]} )
        echo $PYTHON_EXE | egrep "python([2-9]\.[0-9])?" >/dev/null 2>&1
        if [[ $? == 0 ]]; then
            PYTHON_SCRIPT=$( basename -- ${COMP_WORDS[1]} )
            echo $PYTHON_SCRIPT | egrep "manage\.py|django-admin(\.py)?" >/dev/null 2>&1
            if [[ $? == 0 ]]; then
                COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]:1}" \
                               COMP_CWORD=$(( COMP_CWORD-1 )) \
                               DJANGO_AUTO_COMPLETE=1 ${COMP_WORDS[*]} ) )
            fi
        fi
    fi
}

# Support for multiple interpreters.
unset pythons
if command -v whereis &>/dev/null; then
    python_interpreters=$(whereis python | cut -d " " -f 2-)
    for python in $python_interpreters; do
        pythons="${pythons} $(basename -- $python)"
    done
    pythons=$(echo $pythons | tr " " "\n" | sort -u | tr "\n" " ")
else
    pythons=python
fi

complete -F _python_django_completion -o default $pythons

