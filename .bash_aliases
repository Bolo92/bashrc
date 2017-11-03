#!/bin/bash
# .bash_aliases - Bash Shell Aliases
# Author: Bolo92 - bolo92@gmail.com

# Some common shortcuts for file-/directory commands
alias ls='ls --color=auto'
alias la='ls -la'
alias laSh='ls -laSh'
alias grep='grep --color=auto'

#apt
alias install='sudo apt-get install'
alias uninstall='sudo apt-get remove'
alias reinstall='sudo apt-get --reinstall install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get remove --purge'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias search='apt-cache search'
alias show='apt-cache show'
alias policy='apt-cache policy'

# My Alias
alias v='vim'

# Wake my computer
alias wake='wakeonlan 74:D4:35:8A:7C:43'

# rerun last command with sudo according to issue #1
alias fuck='sudo $(history -p \!\!)'

# Print 20 biggest directories
alias folders='find . -maxdepth 1 -type d -print | xargs du -h | sort -h | tail -n 20'

# Scan 100 most common ports
alias nmap-top='nmap -F'

# Full TCP port scan with service version detection
alias nmap-fast='nmap -sS -sV -T4'

# Scan all 65535 ports
alias nmap-all='nmap -p- -sV -sS -T4'

# Ping scans the network, listing machines that respond to ping.
alias nmap-ping='nmap -sP'
