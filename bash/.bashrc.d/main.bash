
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



function testrecent {
	{
		git diff --name-only $(git merge-base --fork-point develop)..HEAD .
		git status -s --porcelain | xargs -L1 | cut -d' ' -f2
	} | grep '/tests/' | xargs bash -xc 'hans test --tb=native "$@"' -s
}

function findcmd {
	FZF_DEFAULT_COMMAND="(cat ~/.bash_history) | sort | uniq" fzf \
		--bind 'enter:execute(clear; bash -lc {}; read -n 1 -s -r -p "[Press AnyKey]")' \
		--bind 'ctrl-j:execute(clear; bash -lc {q}; read -n 1 -s -r -p "[Press AnyKey]")' \
		# --bind 'change:reload:cd /tmp; sudo -u nobody -- $(echo {q} | cut -d" " -f1,2) --help 2>&1 \
		--preview 'cd /tmp; sudo -u nobody -- $(echo {q} | cut -d" " -f1,2) --help' \
		--preview-window='right:60%'
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
