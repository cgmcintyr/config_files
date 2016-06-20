# Bash settings file for everything prompt related

Green='\[\e[0;32m\]'
Red='\[\e[0;31m\]'
Blue='\[\e[0;34m\]'
Cyan='\[\e[0;36m\]'
Yellow='\[\e[0;33m\]'

BGreen='\[\e[1;32m\]'
BRed='\[\e[1;31m\]'
BBlue='\[\e[1;34m\]'
BCyan='\[\e[1;36m\]'
BYellow='\[\e[1;33m\]'

NC='\[\e[0m\]'

# Set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Function to show current git branch
function parse_git_branch
{
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set prompt
if [ $(id -u) -eq 0 ];
then
    PS1="${debian_chroot:+($debian_chroot) }[${BRed}\u${NC}] [\h] ${Green}\w${NC} [$(parse_git_branch)]\n> "
else
    PS1="${debian_chroot:+($debian_chroot) }[${BYellow}\u${NC}] [\h] ${Green}\w${NC} [$(parse_git_branch)]\n> "
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
