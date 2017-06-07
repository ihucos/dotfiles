syntax on
set nocompatible
set t_Co=16
set number
set tags=.git/tags; " see http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
set noswapfile
set clipboard=unnamed
set background=dark

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
call plug#end()

colo solarized

au FileType gitcommit set spell
au FileType gitcommit hi clear SpellBad
au FileType gitcommit hi SpellBad cterm=underline


au FileType python execute "setlocal colorcolumn=" . join(range(81,335), ',')
au FileType diff setlocal statusline=


hi String ctermbg=0
hi ErrorMsg ctermfg=8 ctermbg=9
hi diffRemoved ctermfg=9
hi diffSubname ctermfg=4
hi! LineNr ctermbg=0 ctermfg=10

set grepprg=ag\ --nogroup\ --nocolor\ --html

au FileType python setlocal makeprg=flake8\ %\ --ignore=E226,E731,F405
nnoremap <space>m :silent make\|redraw!\|cc<CR>

nnoremap <space>i :%!isort -a  -<left><left>
" vnoremap <space>f :%!yapf --lines <C-r>=line("'<")<CR>-<C-r>=line("'>")<CR>
vnoremap <space>f :%!autopep8 --max-line-length=94 -aa -p 500 --range <C-r>=line("'<")<CR> <C-r>=line("'>")<CR> -
" autopep8 --max-line-length=94 -aa -p 500 --range 
