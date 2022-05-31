#
# INIT
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
	if [ -z "$4" ]
	then
		expand='<cword>'
	else
		expand="$4"
	fi
	vimadd  "noremap <leader>$2 :$floatbase --autoclose=$1 bash -lc '$3 \"<c-r>=expand('${expand}')<cr>\"'<cr>"
}


#
# END INIT
#



#mapfloat 1 fb findbranch
#function findbranch {
#	git branch -a |
#		grep -v '*' |
#		xargs -L1 |
#		fzf --preview "git log --stat $(git merge-base --fork-point develop {})..{}" |
#		xargs git checkout
#}
#
#
#mapfloat 1 fe findtest
#function findtest {
#	git ls-files |
#		xargs ctags --excmd=number -f - |
#		grep '^test_\|^Test[A-Z]' |
#		grep "class:"|
#		awk '{print $2 " " substr($5, 7) " " $1}' |
#		sort |
#		column -t |
#		fzf |
#		awk '{ print $1 "::" $2 "::" $3}' |
#		xargs hans test
#}




#mapfloat 1 fs findstatus
#function findstatus {
#	git status -s |
#		fzf --preview -d' ' --nth 2 --preview 'git diff HEAD {2}' |
#		awk  '{print $2}' |
#		xargs -I {} nvr +FloatermHide +'e {}'
#}

#mapfloat 0 b vimblack "%:p"
#function vimblack {
#	plash --from ubuntu:focal --apt python3-pip -l --pip3 black==19.10b0 -- /usr/local/bin/black "$1"
#}
#
#mapfloat 0 i vimisort "%:p"
#function vimisort {
#	isort --skip venv3 --skip venv --skip venv2 --skip migrations --settings-path setup.cfg "$1"
#}



vimadd  "noremap <leader> :FloatermNew --title=━ --borderchars=━┃━┃┏┓┛┗ --width=0.9 --height=0.90 --autoclose=1 python3 ~/verbs/verbs.py \"<c-r>=expand('"%:p"')<cr>\" \"<c-r>=line('.')<cr>\" \"<c-r>=expand('<cword>')<cr>\"<cr>"


#map o ':w<CR>'
#map x ':tabnew<CR>:terminal<CR>A'
#map c ':tabnew<CR>:terminal<CR>A'
#map v ':source ~/.config/nvim/init.vim<CR>'
#map tt ':let @a=expand("%:p")<CR>:tabnew<CR>:terminal<CR>ihans test --tb=native<C-\><C-N>"api'
