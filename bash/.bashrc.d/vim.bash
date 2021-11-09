

function findfiles {
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


function findalias {
	bash -lc 'compgen -A function' | sort | uniq |
		fzf \
		    --preview 'bash -lc "alias {} 2> /dev/null || declare -f {}"' \
		    --preview-window='right:66%' |
		    xargs bash -lc
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
	find ~/byrd ~/dotfiles -maxdepth 4 -name .git -type d -prune |
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
	git ls-files |
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


export VIM_EVAL="echo " # dummy comamnd
function vimadd {
	VIM_EVAL="$VIM_EVAL | $1"
}
function map {
	vimadd "map $1 $2"
}

floatbase="FloatermNew --title=━ --borderchars=━┃━┃┏┓┛┗ --width=0.8 --height=0.90"

function mapfloat {
	vimadd  'map <leader>'"$1"' :'"$floatbase"' --autoclose=1 bash -lc '"$2"' <c-r>=expand("<cword>")<cr><cr>'
}

function mapfloat0 {
	vimadd  'map <leader>'"$1"' :'"$floatbase"' --autoclose=0 bash -lc '"$2"' <c-r>=expand("<cword>")<cr><cr>'
}

mapfloat ff findfiles
mapfloat fr findrecent
mapfloat fs findstatus
mapfloat fd finddirectory
mapfloat fb findbranch
mapfloat fl findlines
mapfloat ft findtags
mapfloat0 fa findalias
mapfloat0 tr testrecent

map '<leader>tf' ':'"$floatbase"' hans test --tb=native <C-r>=expand('"'"'%'"'"')<CR><CR>'


mapfloat l lazygit
mapfloat s bash
mapfloat gd "git diff"



map '<leader>j' ':!bash -lc openjira<CR>'

