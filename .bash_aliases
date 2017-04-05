#!/bin/bash
# .bash_aliases - Bash Shell Aliases
# Author: Bolo92 - bolo92@gmail.com

# Some common shortcuts for file-/directory commands
alias ls='ls --color=auto'
alias la='ls -la'
alias laSh='ls -laSh'
alias grep='grep --color=auto'

# My Alias
alias v='vim'

# Wake my computer
alias wake='wakeonlan 74:D4:35:8A:7C:43'

# rerun last command with sudo according to issue #1
alias fuck='sudo $(history -p \!\!)'

# print local IP address, because hostname -I is linux only
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# Print 20 biggest directories
alias folders="find . -maxdepth 1 -type d -print | xargs du -h | sort -h | tail -n 20"
