# Christopher McIntyre's ~/.bashrc 

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## OPTIONS AND VARIABLES
shopt -s no_empty_cmd_completion # Stop bash trying to auto-complete empty lines
shopt -s histappend              # Append to history file rather than overwriting
shopt -s checkwinsize            # If necessary, update LINES/COLUMNS after each command 
shopt -s cmdhist                 # Mult-line histories
shopt -s globstar                # Enable recursive globbing with **

HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=2000
HISTFILESIZE=5000


## EXPORTS 
export PS1='\u@\h:\w\$ '
export EDITOR='vim'
export GIT_EDITOR='vim'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# PNet MySQL Settings
export net_plus_dev_mysql_driver="com.mysql.jdbc.Driver"
export net_plus_dev_mysql_hostname="localhost"
export net_plus_dev_mysql_port="3306"
export net_plus_dev_mysql_user="root"
export net_plus_dev_mysql_password=""


## SOURCE SCRIPTS 
funcdir="$HOME/bashscripts"

for file in `ls ${funcdir}`; do
    afile=${funcdir}/$file
    if [ -x $afile ]; then
        . $afile
    fi
done


## OTHER

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Jumpdir
function jd {
    TARGET="$(jumpdir-search search $@)"

    if [ $TARGET != "None" ]; then
        cd $TARGET
    else
        echo "Jumpdir could not find a matching directory :("
    fi
}
