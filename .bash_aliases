#!/bin/bash
# .bash_aliases - Bash Shell Aliases
# Author: Bolo92 - bolo92@gmail.com

# Some common shortcuts for file-/directory commands
alias ls='ls --color=auto'
alias la='ls -la'
alias laSh='ls -laSh'
alias grep='grep --color=auto'
alias 

# My Alias
alias v='vim'
# Execute the last command as root
alias fuck='sudo $(history | tail -n 2 | head -n 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g")'
# Wake my computer
alias wake='wakeonlan 74:D4:35:8A:7C:43'
# rerun last command with sudo according to issue #1
alias fuck='sudo $(history -p \!\!)'
