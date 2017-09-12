# Variables
UrlVimrc="https://raw.githubusercontent.com/Bolo92/bashrc/master/.vimrc"
UrlBashrc="https://raw.githubusercontent.com/Bolo92/bashrc/master/.bashrc"
UrlVimColor="https://raw.githubusercontent.com/Bolo92/bashrc/master/.vim/colors/wombat256mod.vim"
UrlBashAliases="https://raw.githubusercontent.com/Bolo92/bashrc/master/.bash_aliases"
VimDirectory="$HOME/.vim"
VimrcLocation="$HOME/.vimrc"
BashAliases="$HOME/.bash_aliases"

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

RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[38;5;230m\]"
BLUE="\[\033[38;5;43m\]"
GRASS="\[\033[38;5;106m\]"
GREEN="\[\033[38;5;2m\]"
WHITE="\[\033[38;5;15m\]"
SMILEY="${GREEN}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

export PS1="\`${SELECT}\` ${YELLOW}\u@${BLUE}\H${WHITE}:${GRASS}[\w]: ${NORMAL}"

# Functions
function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on $HOSTNAME"
    echo -e "\nAdditionnal information: " ; uname -a
    echo -e "\nUsers logged on: " ; w -h
    echo -e "\nCurrent date : " ; date
    echo -e "\nMachine stats : " ; uptime
    echo -e "\nMemory stats : " ; free -m 2>&- ;
    echo -e "\nLocal IP Address :" ; hostname -I
    echo -e "\nEXternal IP Address :" ; extip
    echo -e "\nListen ports : "; netstat -ntlp;
}

function download_bashrc(){
    cd $HOME ;
    wget -q -O .bashrc "$UrlBashrc" ;
    wget -q -O .bash_aliases "${UrlBashAliases}" ;
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

function extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function ipadr() {
    curl ipinfo.io/$1;
    echo "";
}

function extip() {
    curl -s http://whatismyip.akamai.com/
}

s() { # do sudo, or sudo the last command if no argument given - source: http://serverfault.com/a/3847
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

#bu - Back Up a file. Usage "bu filename.txt"
bu () {
    cp $1 ${1}-`date +%Y-%m-%d-%H_%M`.backup ;
}

# check basic info about SSL cert installed on domain. Usage check_ssl example.com
check_ssl () {
echo | openssl s_client -servername $1 -connect ${1}:443 2>/dev/null | openssl x509 -noout -dates -issuer -subject
}

# call functions
download_vimrc
download_bashrc
tydzien
# End
