#!/bin/bash

alias ls='ls -F --color=auto'
alias ll='ls -Fl --color=auto'
alias la='ls -aFl --color=auto'
alias tree='tree -CF'

# C
alias gcc='gcc -Wall -Werror -std=c99 -L/usr/local/lib -I/usr/local/include'

# Django
alias dj='python manage.py'
alias djrun='python manage.py runserver'

# Python
alias pysimpleserve='python -m SimpleHTTPServer 8080'

# Scheme
alias scheme='rlwrap mit-scheme'
alias scheme='rlwrap guile'

# TCP Port Shortcuts
alias openport='sudo iptables -A INPUT -p tcp -j ACCEPT --dport'
alias closeport='sudo iptables -A INPUT -p tcp -j DROP --dport'

# Kick network-manager
alias eduroam='sudo service network-manager restart'

# Search aliases
alias strgrep='grep -Ril'

# Docker
alias dcleancontainers 'docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm'
alias dcleanimages 'docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi'
alias dclean 'dcleancontainers && dcleanimages'
