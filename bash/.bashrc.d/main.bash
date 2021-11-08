
set -o vi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias ll='ls -alF'
alias la='ls -A'

# from ubuntu
if [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

alias cdvim='nvr +"!pwd > /tmp/_vimpwd"; cd "$(cat /tmp/_vimpwd)"'

function pr {
	id="$(gh pr view --json number --jq '.number')"
	gh api /repos/{owner}/{repo}/pulls/"$id"/comments |
	jq '.[] | select( .user.login != "ihucos" ) |"\(.path) \(.original_line) \(.body)"' |
	sed 's:^.\(.*\).$:\1:' |
	sed 's/ /:/1' |
	sed 's/ /:/1'
}



function startvpn {
	(cd ~/Documents/vpn && sudo openvpn --config /home/irae/Documents/vpn/aws-byrd.ovpn --daemon)
}

function genctags {
	git ls-files | xargs ctags --exclude=api_spec.json
}



function findlines {
	ag . |
		fzf \
			--query="$1" \
			--tac \
			--exact \
			--no-extended \
			-d: \
			-n3.. \
			--no-sort \
			--preview "cat {1} --number | tail --lines=+{2}"\
			--preview-window='bottom:10' |
	cut -d: -f1,2 |
	tr ':' ' ' |
	xargs sh -c '[ -z $1 ] && exit 0; nvr +FloatermHide "+e $0" +$1'
}


function findtags {
	git ls-files |
		xargs ctags --excmd=number -f - |
		fzf \
			--query="$1" \
			--exact -d$'\t' \
			--with-nth=1 \
			--nth=1 \
			--preview 'a={3}; printf {2}"\n"; cat -n {2} | tail --quiet -n +${a::-2}' \
			--preview-window='right:70%' |
			python3 -c '
import os
try:
    i=input().split("\t")
except EOFError:
    pass
else:
    os.execlp("nvr", "nvr", "+FloatermHide", f"+e {i[1]}", f"+{i[2][:-2]}")'
}

function finddirectory {
	line='echo $(basename $(dirname "$1")),$(dirname ${1/#$HOME/\~})'
	find ~/byrd -maxdepth 4 -name .git -type d -prune |
		xargs -L1 bash -c "$line" -- |
		column -ts, |
		sort |
		fzf -s, --nth 1 --exact |
		awk '{ print $2 }' |
		xargs -I{} nvr -c 'cd {}'
}

function findbranch {
	git branch -a |
		grep -v '*' |
		xargs -L1 |
		fzf --preview "git log --stat $(git merge-base --fork-point develop {})..{}" |
		xargs git checkout
}


function findfiles {
	ag -l |
		fzf --preview 'cat -n {}' |
		xargs -I {} nvr +FloatermHide +'e {}'
}

function findstatus {
	git status -s |
		fzf --preview -d' ' --nth 2 --preview 'git diff HEAD {2}' |
		awk  '{print $2}' |
		xargs -I {} nvr +FloatermHide +'e {}'
}

function findrecent {
	{
		git diff --name-only $(git merge-base --fork-point develop)..HEAD .
		git status -s --porcelain | xargs -L1 | cut -d' ' -f2
	} |
		fzf --preview 'git diff develop {}' |
		xargs -I {} nvr +FloatermHide +'e {}'
}

function findcmd {
	FZF_DEFAULT_COMMAND="(cat ~/.bash_history) | sort | uniq" fzf \
		--bind 'enter:execute(clear; bash -lc {}; read -n 1 -s -r -p "[Press AnyKey]")' \
		--bind 'ctrl-j:execute(clear; bash -lc {q}; read -n 1 -s -r -p "[Press AnyKey]")' \
		# --bind 'change:reload:cd /tmp; sudo -u nobody -- $(echo {q} | cut -d" " -f1,2) --help 2>&1 \
		--preview 'cd /tmp; sudo -u nobody -- $(echo {q} | cut -d" " -f1,2) --help' \
		--preview-window='right:60%'
}

function findalias {
	bash -lc 'compgen -A function' | sort | uniq |
		fzf \
		    --preview 'bash -lc "alias {} 2> /dev/null || declare -f {}"' \
		    --preview-window='right:66%' |
		    xargs bash -lc
}



function blackall {
	black $(
		git diff --name-only $(git merge-base --fork-point develop)..HEAD .
		git status -s --porcelain | xargs -L1 | cut -d' ' -f2
		) 
}


function openjira(){
	rawticket="$(git branch --show-current | tr '-' '\n' | egrep '[a-z]+[0-9]+')"
	project=$(echo "$rawticket" | grep -o "[a-z]*" | tr a-z A-Z)
	id=$(echo "$rawticket" | grep -o "[0-9]*")
	xdg-open "https://getbyrd.atlassian.net/browse/$project-$id"
}

function startticket(){
	me='ihc'
	set -e
	title=$(curl "https://getbyrd.atlassian.net/rest/api/latest/issue/$1" --fail -H "Cookie: $JIRA_COOKIE" | jq '.fields.summary' -r)
	echo $title
	return
	branch="$(slugify "$title")-$(echo $1 | sed 's/-//' | tr A-Z a-z)-$me"
	set -x
	git checkout develop
	git pull
	git checkout -b "$branch"
	set +xe
	echo "I wish you fun"
}
