#
# END INIT
#
export VIM_EVAL="echo " # dummy comamnd
function vimadd {
	VIM_EVAL="$VIM_EVAL | $1"
}
function vimappend {
	VIM_EVAL="${VIM_EVAL}$1"
}
function map {
	vimadd "noremap <leader>$1 $2"
}

floatbase="FloatermNew --title=━ --borderchars=━┃━┃┏┓┛┗ --width=0.9 --height=0.90"

function mapfloat {
	if [ -z "$3" ]
	then
		expand='<cword>'
	else
		expand="$3"
	fi
	vimadd  "noremap <leader>$1 :$floatbase bash -lc '$2 <c-r>=expand('${expand}')<cr>'<cr>"
}

function mapfloat0 {
	if [ -z "$3" ]
	then
		expand='<cword>'
	else
		expand="$3"
	fi
	vimadd  "noremap <leader>$1 :$floatbase --autoclose=0 bash -lc '$2 <c-r>=expand('${expand}')<cr>'<cr>"
}
#
# END INIT
#


mapfloat ff findfiles
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


mapfloat0 fa findalias
function findalias {
	bash -lc 'compgen -A function' | sort | uniq |
		fzf \
		    --preview 'bash -lc "alias {} 2> /dev/null || declare -f {}"' \
		    --preview-window='right:66%' |
		    xargs bash -lc
}



mapfloat fl findlines
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


mapfloat ft findtags
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

mapfloat fd finddirectory
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

mapfloat fb findbranch
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



mapfloat fs findstatus
function findstatus {
	git status -s |
		fzf --preview -d' ' --nth 2 --preview 'git diff HEAD {2}' |
		awk  '{print $2}' |
		xargs -I {} nvr +FloatermHide +'e {}'
}

mapfloat fr findrecent
function findrecent {
	{
		git diff --name-only $(git merge-base --fork-point develop)..HEAD .
		git status -s --porcelain | xargs -L1 | cut -d' ' -f2
	} |
		fzf --preview 'git diff develop {}' |
		xargs -I {} nvr +FloatermHide +'e {}'
}



mapfloat0 b vimblack "%:p"
function vimblack {
	plash --from ubuntu:focal --apt python3-pip -l --pip3 black==19.10b0 -- /usr/local/bin/black "$1"
}

mapfloat0 i vimisort "%:p"
function vimisort {
	isort --skip venv3 --skip venv --skip venv2 --skip migrations --settings-path setup.cfg "$1"
}

mapfloat0 tr testrecent

map 'tf' ':'"$floatbase"' hans test --tb=native <C-r>=expand('"'"'%'"'"')<CR><CR>'


mapfloat l lazygit
mapfloat s bash
mapfloat gd "git diff"


map 'j' ':!bash -lc openjira<CR>'
map o ':w<CR>'
map x ':tabnew<CR>:terminal<CR>A'
map c ':tabnew<CR>:terminal<CR>A'
map v ':source ~/.config/nvim/init.vim<CR>'
map tt ':let @a=expand("%:p")<CR>:tabnew<CR>:terminal<CR>ihans test --tb=native<C-\><C-N>"api'
