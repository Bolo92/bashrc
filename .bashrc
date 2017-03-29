# Variables
UrlVimrc="https://raw.githubusercontent.com/Bolo92/bashrc/master/.vimrc"
UrlBashrc="https://raw.githubusercontent.com/Bolo92/bashrc/master/.bashrc"
UrlVimColor="https://raw.githubusercontent.com/Bolo92/bashrc/master/.vim/colors/wombat256mod.vim"
VimDirectory="$HOME/.vim"
VimrcLocation="$HOME/.vimrc"

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

export PS1="\[\033[38;5;230m\]\u@\[$(tput sgr0)\]\[\033[38;5;43m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;136m\][\[$(tput sgr0)\]\[\033[38;5;106m\]\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Functions
function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on $HOSTNAME"
    echo -e "\nAdditionnal information: " ; uname -a
    echo -e "\nUsers logged on: " ; w -h
    echo -e "\nCurrent date : " ; date
    echo -e "\nMachine stats : " ; uptime
    echo -e "\nMemory stats : " ; free -m 2>&- ;
#    echo -e "\nLocal IP Address :" ; myip
#    echo -e "\nOpen connections : "; netstat -pan --inet;
    echo
}

function download_bashrc(){
    cd $HOME ;
    wget -q -O .bashrc "$UrlBashrc" ;
}

function download_vimrc(){
    cd $HOME
    mkdir -p ${VimDirectory}/colors ;
    wget -q -O ${VimDirectory}/colors/wombat256mod.vim ${UrlVimColor} ;
    wget -q -O ${VimrcLocation} "$UrlVimrc" ;
}

function tydzien(){
    tydzien=`date +%V`
        if [[ $((((10#$tydzien)) % 2)) -eq 0 ]] ;
    then echo -e "${tydzien} jest parzysty -\033[1;31m zmiana Wojtka \033[0m" ;
    else echo -e "${tydzien} jest nieparzysty -\033[1;35m zmiana Marcina \033[0m" ;
fi
}

# call functions
download_vimrc
download_bashrc
tydzien
# End
