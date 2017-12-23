set nocompatible
set number
set tags=.git/tags; " see http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
set noswapfile
set clipboard=unnamed
set background=dark
set grepprg=ag\ --nogroup\ --nocolor\ --html

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
call plug#end()

au FileType gitcommit set spell
au FileType diff setlocal statusline=
au FileType python setlocal makeprg=flake8\ %\ --ignore=E226,E731,F405

nnoremap <space>m :silent make\|redraw!\|cc<CR>
nnoremap <space>i :%!isort -a  -<left><left>
vnoremap <space>f :%!autopep8 --max-line-length=94 -aa -p 500 --range <C-r>=line("'<")<CR> <C-r>=line("'>")<CR> -

syntax off
