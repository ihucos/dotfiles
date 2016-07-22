tnoremap <C-a> <C-\><C-n>
nnoremap <C-a> :normal i<CR>

tmap <C-w> <C-\><C-n><C-w>

noremap <C-w><C-s> <C-w><C-s><C-\><C-n>:terminal<cr>
noremap <C-w>s     <C-w><C-s><C-\><C-n>:terminal<cr>
noremap <C-w>v     <C-w><C-v><C-\><C-n>:terminal<cr>
noremap <C-w><C-v> <C-w><C-v><C-\><C-n>:terminal<cr>
" noremap <C-j> <C-w><C-s>:terminal<cr><C-w>x

autocmd BufWinEnter,WinEnter term://* startinsert

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
