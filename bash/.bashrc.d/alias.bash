alias tmux="TERM=xterm-256color tmux"

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'
alias lx='ls -lXB'        # sort by extension

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias sl='sudo !!' # [s]udo [l]ast command
alias lscolors='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'
alias ipython="ipython --no-banner"
