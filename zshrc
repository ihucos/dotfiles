
alias tmux='TERM=xterm-256color-italic tmux'
export TERM=xterm-256color-italic


alias ls='ls -G'


### EXPERIMENTAL
export PYTHONDONTWRITEBYTECODE="1"
###

export EDITOR='vim'

export LESS=" -R "

PATH=$PATH:~/.bin:~/bin

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

# FIXME: really nice but seems not to work
# make sudo pass my aliasses
alias sudo='sudo '

gitexec(){(cd `git rev-parse --show-toplevel` && "$@")}
alias manage.py='gitexec python manage.py'
alias gitroot="git rev-parse --show-toplevel"


# alias ls='ls --group-directories-first --sort=extension --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'
alias lx='ls -lXB'        # sort by extension
alias lt='ls -ltr'        # sort by date

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
alias ipython="ipython --no-banner"

lscommands() {
    (alias | cut -f1 -d= ; hash -f; hash -v | cut -f 1 -d= ; typeset +f) | sort
}

man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
	LESS_TERMCAP_md=$'\E[38;5;4m' \
	LESS_TERMCAP_me=$'\E[0m' \
	LESS_TERMCAP_se=$'\E[0m' \
	LESS_TERMCAP_so=$'\E[1;30;43m' \
	LESS_TERMCAP_ue=$'\E[0m' \
	LESS_TERMCAP_us=$'\E[38;5;6m' \
	man "$@"
}
manpdf(){
  man -t $1 | ps2pdf - /tmp/man.pdf && xdg-open /tmp/man.pdf
}


dict(){ local y="$@";curl -sA"Opera" "http://www.google.com/search?q=define:${y// /+}"|grep -Po '(?<=<li>)[^<]+'|nl|perl -MHTML::Entities -pe 'decode_entities($_)' 2>/dev/null;}

md () { mkdir -p "$@" && cd "$@"; }

calc () { echo "$*" | bc -l; }

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

alias mytmux="tmux -f <(curl -s https://raw.githubusercontent.com/nomoral/dotfiles/master/tmux.conf)"
alias mybash="bash --rcfile <(curl -s https://raw.githubusercontent.com/nomoral/dotfiles/master/bashrc)"
alias myvim="vim -u <(curl -s https://raw.githubusercontent.com/nomoral/dotfiles/master/vimrc | grep '^ [a-zA-Z]\+ ')"
alias v=vim
alias e=vim
alias :e=vim
alias vimrc="vim ~/Dotfiles/vimrc"
alias bashrc="vim ~/Dotfiles/bashrc"
alias zshrc="vim ~/Dotfiles/zshrc"
alias tmux.conf="vim ~/Dotfiles/tmux.conf"
alias tmuxconf="vim ~/Dotfiles/tmux.conf"
alias tmuxrc="vim ~/Dotfiles/tmux.conf"

# PS1='\[\033[0;32;40m\]\u:$(pwd) $\e[0m '
PS1='\u:$(pwd)$ '


# alias ssh="TERM=screen-256color ssh"
# alias fzf="TERM=screen-256color fzf" # fzf needs a correct TERM, it's picky about it, this is a hack

pstrings(){
  gitexec ag  "\"[^\"\n]{0,81}\"|'[^'\n]{0,81}'" --color | fzf --ansi --tac
}
plines(){
  out=$(gitexec ag  . | grep --color -E '[^:]*:' | fzf --reverse --extended-exact --no-sort)
  array=("${(@s/:/)out}") # @ modifier
  file="${array[1]}"
  linenr="${array[2]}"
  tmux send-keys "vim \`gitroot\`/$file +$linenr" Enter
}

_pfiles(){
  gitexec ag  -l | fzf --tac
  # ag  "^.{1,}$" | grep --color -E '[^:]*:' | fzf --tac
}
pfiles(){
  out=$(_pfiles)
  if [ "$?" -eq 0 ]; then
    tmux send-keys "vim \`gitroot\`/$out" Enter
  fi
}

pallfiles(){
  tmux send-keys "file $(find / 2> /tmp/null | fzf --extended-exact)" Enter
}

pcommands(){
  tmux send-keys "`lscommands | fzf` "
}

ppackages(){
  tmux send-keys "sudo apt-get install `apt-cache search '' | fzf | cut -d' ' -f1` "
}

_ptags(){
  gitexec cat .git/tags | cut -d$'\t' -f1 | grep -v "^\!" | sort -u | fzf
}

ptags(){
  tmux send-keys "vim +\"normal zz\" -t `_ptags`" Enter
}

_prefix(){
  sed -e "s/^/;;$1  /"
}

pall(){
 # sed -e 's/^/;F '
 (cd `git rev-parse --show-toplevel` &&  {\
   ag -l | _prefix "F" ;
   cat .git/tags | cut -d$'\t' -f1 | grep -v "^\!" | sort -u | _prefix "T" ;
   git branch | _prefix "B" ; \
   ag -l | xargs dirname | sort -u | _prefix "D" ;
   ag . | grep --color -E '[^:]*:' |  _prefix "L" ;
 } | fzf --extended-exact --query=";;f ")
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
