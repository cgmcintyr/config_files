#!/bin/bash

alias ls='ls -F --color=auto'
alias ll='ls -Fl --color=auto'
alias la='ls -aFl --color=auto'
alias tree='tree -CF'

# Django
alias dj='python manage.py'
alias djrun='python manage.py runserver'

# Python
alias pysimpleserve='python -m SimpleHTTPServer 8080'

# TCP Port Shortcuts
alias openport='sudo iptables -A INPUT -p tcp -j ACCEPT --dport'
alias closeport='sudo iptables -A INPUT -p tcp -j DROP --dport'

# Kick network-manager
alias eduroam='sudo service network-manager restart'
