

# TODO: backup command that backs up a file, so whe can delete it
# TODO: comamnd annoyance: trello card create -b CBcznUbM -l 54424eda008a0516f41416f4 -n "annoyance description"
# TODO command to cd to folder with .git in in root folders

# alias tmux='TERM=rxvt-unicode-256color tmux'


### EXPERIMENTAL

export PYTHONDONTWRITEBYTECODE="1"


###

export EDITOR='vim'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

shopt -s cmdhist # Combine multiline commands into one in history
shopt -s autocd # no need to type cd anymore
export HISTIGNORE="&:ls:[bf]g:exit:cd:history:reset:clear"
shopt -s histappend # append to the history file, don't overwrite it

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTTIMEFORMAT="[%DT%T] " # puts full date and time in history records.

export LESS=" -R "

export PYTHONSTARTUP="$HOME/.pythonrc"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PATH=$HOME/.dynamic-colors/bin:$PATH:~/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# no bell
set 'bind bell-style none'

# PS1='\[\e[132m\]  [ ${debian_chroot:+($debian_chroot)}\u \h \w ]\[\e[0m\]_____________________\n  $ '
# PS1='%'"$COLUMNS"'s' | sed 's/ /_/g'

export PS1=' \[\e[38;5;10m\]\[\e[0m\] '

if [ "$HOSTNAME" = macbook ] && [ "$USER" = resu ] ; then
  PS1=$PS1' \[\e[38;5;10m\]\w\[\e[0m\]  \[\e[1;37m\]▶\[\e[0m\] '
else
  # FIXME: not working
  if [ "$USER" = root ] ; then
    # prompt='#'
    PS1=$PS1'\[\e[38;5;10m\]${debian_chroot:+($debian_chroot)}\u@\h:\w\[\e[0m\] \[\e[38;05;1m\]▶ \[\e[0m\]'
  else
    # prompt='▶'
    PS1=$PS1'\[\e[38;5;10m\]${debian_chroot:+($debian_chroot)}\u@\h:\w\[\e[0m\] \[\e[1;37m\]$ \[\e[0m\]'
  fi
  # PS1='  \[\e[38;5;10m\]${debian_chroot:+($debian_chroot)}\u@\h:\w\[\e[0m\] \[\e[1;37m\]'$prompt' \[\e[0m\]'
fi

# ${#PWD}
# PS1='`printf "%$((20-${#PWD}))s"`''h >'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

export GREP_COLOR='43;30'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases

alias lsalias='compgen -a | xargs'

alias :q=exit

alias g=git

alias ls='ls --group-directories-first --sort=extension --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'
alias lx='ls -lXB'        # sort by extension
alias lt='ls -ltr'        # sort by date

alias s="printf '\n\n\n\n'"
alias ai="sudo apt-get install -y"
alias as="apt-cache search"
alias ar="sudo apt-get remove -y"
alias au="sudo apt-get update"

alias pipi="sudo pip install"
alias pips="pip search"
alias pipu="sudo pip uninstall"
alias pipr="sudo pip uninstall"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias hist='history | grep $1'
alias path='echo -e ${PATH//:/\\n}'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias sl='sudo !!' # [s]udo [l]ast command
alias trash='mv -t ~/.local/share/Trash/files'
alias lscolors='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'

alias lscommands='ls ${PATH//:/ }'

alias dark="dynamic-colors switch solarized-dark"
alias light="dynamic-colors switch solarized-light"

homer(){
  # http://simpsonswiki.com/w/images/b/bd/Homer_Simpson.png and flipped with `convert -flop Homer_Simpson.png Homer_Simpson_Flipped.png`
  (xcowsay --image ~/Pictures/Homer_Simpson_Flipped.png --bubble-at=-40,-180 --at=0,9999 "$@" & )
}

flash(){
  # if xbacklight is installed
  if hash xbacklight 2>/dev/null; then
    local current=$(xbacklight -get)
    xbacklight -set $(calc $current*0.3) -time 50
    xbacklight -set $current -time 200
  fi
}

ack-grep(){
  homer "use \`ag\` instead"
  env ack-grep $@
}

man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# TODO: utility that reads from stdin and pastes in a pastebin



# cmatrix is much cooler!
matrix (){
  (set -o noglob;while sleep 0.05;do for r in `grep -ao '[[:print:]]' /dev/urandom|head -$((COLUMNS/3))`;do [ $((RANDOM%6)) -le 1 ] && r=\ ;echo -ne "\e[$((RANDOM%7/-6+2));32m $r ";done;echo;done)
}

dict(){ local y="$@";curl -sA"Opera" "http://www.google.com/search?q=define:${y// /+}"|grep -Po '(?<=<li>)[^<]+'|nl|perl -MHTML::Entities -pe 'decode_entities($_)' 2>/dev/null;}

md () { mkdir -p "$@" && cd "$@"; }

calc () { echo "$*" | bc -l; }

password() {
  local l=$1
  [ "$l" == "" ] && l=8
  tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
alias genpassword=password
alias mkpassword=password
alias getpassword=password

swap()
{ # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Make your directories and files access rights sane.
resetperm() { chmod -R u=rwX,g=rX,o= "$@" ;}

# make directory to my user
# mine() {adsf}

encrypt (){
  gpg -ac --no-options "$1"
}

decrypt (){
  gpg --no-options "$1"
}

extract() {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

# Creates an archive from given directory
.tar     () { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
.tar.gz  () { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
.tar.bz2 () { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
.zip     () { zip -r   "${1%%/}.zip"    "$1" ; }

psgrep() {
  if [ ! -z $1 ] ; then
    echo "Grepping for processes matching $1..."
    ps aux | grep -v grep | grep $1 
  else
    echo "!! Need name to grep for"
  fi
}

# Add an "alert" alias for long running commands.  Use like this:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

### autocomplete stuff ###
shopt -s cdable_vars # look at variables that might hold directory paths
shopt -s nocaseglob         # pathname expansion will be treated as case-insensitive

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


if [ -f "/usr/share/autojump/autojump.sh" ]; then
  source /usr/share/autojump/autojump.sh
fi
if [ -f "~/.acd_func.sh" ]; then
  source ~/.acd_func.sh
fi
if [ -f "$HOME/.dynamic-colors/completions/dynamic-colors.zsh" ]; then
  source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
fi
if [ -f "/usr/local/bin/virtualenvwrapper_lazy.sh" ]; then
  source /usr/local/bin/virtualenvwrapper_lazy.sh
fi


alias mytmux="tmux -f <(curl -s https://raw.githubusercontent.com/nomoral/dotfiles/master/tmux.conf)"
alias mybash="bash --rcfile <(curl -s https://raw.githubusercontent.com/nomoral/dotfiles/master/bashrc)"
alias myvim="vim -u <(curl -s https://raw.githubusercontent.com/nomoral/dotfiles/master/vimrc | grep '^ [a-zA-Z]\+ ')"
alias v=vim
alias e=vim
alias :e=vim
alias vimrc="vim ~/Dotfiles/vimrc"
alias bashrc="vim ~/Dotfiles/bashrc"
alias tmux.conf="vim ~/Dotfiles/tmux.conf"
alias tmuxconf="vim ~/Dotfiles/tmux.conf"
alias tmuxrc="vim ~/Dotfiles/tmux.conf"

myssh() {
  ssh $@ -t "bash --rcfile <(echo $'"$(cat ~/.bashrc | xxd -ps)"' | xxd -ps -r)"
}

_sshh_background() {
  tmp=$1
  a2=$2
  inotifywait $tmp
  ssh -o "ControlPath=$tmp/%r@%h:%p" $a2 -t "touch /it_works2" # "bash -c '[ -d /tmp/iraes_dotfiles ]'"
}

sshh() {
  tmp=$(mktemp -d)
  # nohup _sshh_background > /dev/null 2>&1 &
  _sshh_background $tmp $@ &
  ssh -o "ControlMaster=yes" -o "ControlPath=$tmp/%r@%h:%p" $@
    # -t "bash --rcfile <(echo $'"$(cat ~/.bashrc | xxd -ps)"' | xxd -ps -r)" $@




  # # sshreuse $@ -t "bash --rcfile <(echo $'"$(cat ~/.bashrc | xxd -ps)"' | xxd -ps -r)"
  # sshreuse HOST "bash -c '[ -d /tmp/iraes_dotfiles ]'"
  # if [ $? = 1 ]; then
  #   scpreuse ~/{.vim,.vimrc} HOST:/tmp/iraes_dotfiles # with tar.gz
  #   # tar zcf - <files> | sshreuse user@host "cd /wherever; tar zxf -"
  # fi
}

sshreuse() { # ssh with controlmaster #FIXME: safe control path dir
  ssh -o "ControlMaster=auto" -o "ControlPath=/tmp/%r@%h:%p" -o "ControlPersist=yes" $@
}

scpreuse() { # ssh with controlmaster #FIXME: safe control path dir
  scp -o "ControlMaster=auto" -o "ControlPath=/tmp/%r@%h:%p" -o "ControlPersist=yes" $@
}

# tmux -f <(curl -s https://raw.githubusercontent.com/nomoral/dotfiles/master/tmux.conf)

getdots() {
  export DOTFILES=/tmp/iraes_dotfiles
  curl -L --connect-timeout 15 https://github.com/nomoral/dotfiles/archive/master.zip > /tmp/iraes_dotfiles.zip
  rm -f /tmp/dotfiles-master -r
  unzip /tmp/iraes_dotfiles.zip -d /tmp
  for f in /tmp/dotfiles-master/*; do
    mv $f $(dirname $f)/.$(basename $f)
  done;
  rm -f $DOTFILES -r
  mv /tmp/dotfiles-master/ $DOTFILES

  # # for vim to use the dotfiles
  # # FIXME: VIMRUNTIME is set at compile time in vim, nevertheless it seems i have to set it
  # export VIMRUNTIME=/usr/share/vim/vim74/
  # export VIM=$DOTFILES/.vim
  # export VIMRC=$DOTFILES/.vimrc
}

# Colorize these commands if possible
if which grc &>/dev/null; then
    alias .cl='grc -es --colour=auto'
    alias configure='.cl ./configure'
    alias diff='.cl diff'
    alias make='.cl make'
    alias gcc='.cl gcc'
    alias g++='.cl g++'
    #alias as='.cl as'
    #alias gas='.cl gas'
    alias ld='.cl ld'
    alias netstat='.cl netstat'
    alias ping='.cl ping -c 10'
    alias traceroute='.cl traceroute'
fi

export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)

print_pre_prompt (){
  local EXIT="$?" # This needs to be first
  if [ $EXIT != 0 ]; then
    # local err="\[\e[41m\]"$EXIT"\[\e[0m\]"
    if [ $EXIT != 130 ]; then # TODO: also not 148 (ctrl-z)
      (flash &)
    fi
    local err="\033[3mExit status \033[0m"'\E[;31m'"\033[1m$EXIT\033[0m\n\n"
  else
    local err=''
  fi
  echo -en $err
  # history -a # write command history at every prompt.
  # history -n
  # history -a; history -c; history -r
}
PROMPT_COMMAND=print_pre_prompt

# # disables "freezing" the terminal with C-s
# stty -ixon
