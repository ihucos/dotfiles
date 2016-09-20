# ============
# Resmio stuff
# ============

alias api.py="vim ~/resmio/bookoya/api.py"
alias models.py="vim ~/resmio/bookoya/models.py"
alias views.py="vim ~/resmio/bookoya/views.py"
alias urls.py="vim ~/resmio/bookoya/urls.py"
alias admin.py="vim ~/resmio/bookoya/admin.py"
alias tasks.py="vim ~/resmio/bookoya/tasks.py"
alias settings.py="vim ~/resmio/resmioproject/settings.py"

alias gs='git status -s'
alias gc='git commit --verbose'
alias gb='git branch --sort=-committerdate | head -n 20'

_e(){
  echo "$ $@"
  $@
  if [ $? -ne 0 ]; then
    exit $?
  fi
}

gpr(){
    (
    _e git checkout master
    _e git checkout -b $1
    _e git commit -a --verbose
    _e git push --set-upstream origin $1
    _e open "https://github.com/resmio/resmio/compare/$1?expand=1"
    )
}


alias ls='ls -G'


export EDITOR='vim'
export LESS=" -R "

alias tmux="TERM=xterm-256color tmux"

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
cdd(){
     export PWD="cd $(git rev-parse --show-toplevel)/$1"
}


git_prompt() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    echo "[$branch $(git status --porcelain 2> /dev/null | grep -c ^)] "
  else
    echo ""
  fi
}


# PS1='\[\033[0;32;40m\]\u:$(pwd) $\e[0m '
# PS1='\u:$(pwd)$ '
PS1='$? \w $(git_prompt)'"\[\033[38;5;15m\]$\[\033[0m\] "


# alias ls='ls --group-directories-first --sort=extension --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'
alias lx='ls -lXB'        # sort by extension
# alias lt='ls -ltr'        # sort by date

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias sl='sudo !!' # [s]udo [l]ast command
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


# Make your directories and files access rights sane.
resetperm() { chmod -R u=rwX,g=rX,o= "$@" ;}

# alias ssh="TERM=screen-256color ssh"
# alias fzf="TERM=screen-256color fzf" # fzf needs a correct TERM, it's picky about it, this is a hack

pstrings(){
  gitexec ag  "\"[^\"\n]{0,81}\"|'[^'\n]{0,81}'" --color | fzf --ansi --tac
}

plines(){
  out=$(gitexec ag  . | grep --color -E '[^:]*:' | fzf --reverse --extended-exact --no-sort)
  file=$(echo $out | cut -f1 -d':')
  linenr=$(echo $out | cut -f2 -d':')
  tmux send-keys "vim \`gitroot\`/$file +$linenr" Enter
}

_pfiles(){
  gitexec ag  -l | fzf --tac
  # ag  "^.{1,}$" | grep --color -E '[^:]*:' | fzf --tac
}
pfiles(){
  vim $(gitroot)/$(_pfiles)
}

_ptags(){
  gitexec cat .git/tags | cut -d$'\t' -f1 | grep -v "^\!" | sort -u | fzf
}

ptags(){
  vim -t $(_ptags)
}

eval $(thefuck --alias)
