tnoremap <C-a> <C-\><C-n>
nnoremap <C-a> :normal i<CR>

" tmap <C-w> <C-\><C-n><C-w>

noremap <C-w><C-s> <C-w><C-s><C-\><C-n>:terminal<cr><C-w> <C-\><C-n><C-w>
noremap <C-w>s     <C-w><C-s><C-\><C-n>:terminal<cr><C-w> <C-\><C-n><C-w>
noremap <C-w>v     <C-w><C-v><C-\><C-n>:terminal<cr><C-w> <C-\><C-n><C-w>
noremap <C-w><C-v> <C-w><C-v><C-\><C-n>:terminal<cr><C-w> <C-\><C-n><C-w>

" noremap <C-j> <C-w><C-s>:terminal<cr><C-w>x

" autocmd BufWinEnter,WinEnter term://* startinsert
" autocmd TermOpen * startinsert

" au VimResized * startinsert
" au InsertLeave * startinsert " does not work




:terminal








" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l






let g:neomake_python_enabled_makers = ['flake8']

function! ReadCmdInp(cmd)
	let mycol = col('.')
	let line = line('$') - line('.')
	execute ':%!' . a:cmd
	call cursor(line('$')-line, mycol)
endfunction

function! Pep8Fix(start_line, end_line)
	  call ReadCmdInp("autopep8 --max-line-length=94 -aa -p 500 --range " .a:start_line." ".a:end_line. " -")
endfunction

function! PyImport(module)
	  call ReadCmdInp('isort -a "'.a:module.'" -')
endfunction

function! SynStack()
	if !exists("*synstack")
		echo 'Syntax hilighting seems not to be supported, check source code of this message'
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! -nargs=0 Syntax call SynStack()

autocmd! BufWritePost * Neomake


call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'altercation/vim-colors-solarized' " does this do something?
Plug 'tpope/vim-sleuth' " auto indent settings finder
call plug#end()










map s <C-w>s
map S <C-w>S
map <ctrl-s> <C-w><ctrl-s>
map <ctrl-v> <C-w><ctrl-v>
map v <C-w>v
map n <C-w>n
map <ctrl-n> <C-w><ctrl-n>
map <ctrl-^> <C-w><ctrl-^>
map ^ <C-w>^
map q <C-w>q
map <ctrl-q> <C-w><ctrl-q>
map c <C-w>c
map <ctrl-c> <C-w><ctrl-c>
" map o <C-w>o   only window, dangerous
map <ctrl-o> <C-w><ctrl-o>
map <Down> <C-w><Down>
map <ctrl-j> <C-w><ctrl-j>
map j <C-w>j
map <Up> <C-w><Up>
map <ctrl-k> <C-w><ctrl-k>
map k <C-w>k
map <Left> <C-w><Left>
map <ctrl-h> <C-w><ctrl-h>
map <bs> <C-w><bs>
map h <C-w>h
map <Right> <C-w><Right>
map <ctrl-l> <C-w><ctrl-l>
map l <C-w>l
map w <C-w>w
map <ctrl-w> <C-w><ctrl-w>
map W <C-w>W
map t <C-w>t
map <ctrl-t> <C-w><ctrl-t>
map b <C-w>b
map <ctrl-b> <C-w><ctrl-b>
map p <C-w>p
map <ctrl-p> <C-w><ctrl-p>
map P <C-w>P
map r <C-w>r
map <ctrl-r> <C-w><ctrl-r>
map R <C-w>R
map x <C-w>x
map <ctrl-x> <C-w><ctrl-x>
map K <C-w>K
map J <C-w>J
map H <C-w>H
map L <C-w>L
map T <C-w>T
map = <C-w>=
map - <C-w>-
map + <C-w>+
map <ctrl-_> <C-w><ctrl-_>
map _ <C-w>_
map < <C-w><
map > <C-w>>
map bar <C-w>bar
map ] <C-w>]
map <ctrl-]> <C-w><ctrl-]>
map g] <C-w>g]
map g_<ctrl-]> <C-w>g_<ctrl-]>
map f <C-w>f
map <ctrl-f> <C-w><ctrl-f>
map F <C-w>F
map gf <C-w>gf
map gF <C-w>gF
map z <C-w>z
map <ctrl-z> <C-w><ctrl-z>
map } <C-w>}
map g} <C-w>g}
