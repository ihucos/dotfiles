call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'ambv/black'
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
Plug 'lifepillar/vim-solarized8'
call plug#end()

syn  off

hi! LineNr ctermbg=black ctermfg=11
hi SignColumn ctermbg=black ctermfg=11
hi AleErrorSign ctermbg=black ctermfg=11
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:ale_set_highlights = 0



hi Search cterm=NONE ctermfg=0 ctermbg=3
hi Visual cterm=NONE ctermfg=0 ctermbg=15
hi Pmenu ctermfg=0 ctermbg=15
hi PmenuSel ctermfg=15 ctermbg=0
hi FloatermBorder guibg=bg guifg=bg                                                                                                                              
hi EndOfBuffer ctermfg=black ctermbg=black
hi ColorColumn ctermbg=black

hi VertSplit ctermfg=black ctermbg=14
hi StatusLine ctermfg=14 ctermbg=0
hi StatusLineNC ctermfg=14 ctermbg=0
hi LineNr ctermbg=black ctermfg=10


set splitbelow
set splitright
set fillchars=vert:┃
" set statusline=%f
set number
set nowrap
execute "set colorcolumn=" . join(range(80,335), ',')



autocmd TermOpen * setlocal nonumber norelativenumber



let mapleader = " "

nnoremap <silent> <leader> :WhichKey'<Space>'<CR>


set tags=./tags;

tnoremap <leader><leader> <C-\><C-n>
imap <leader><leader> <esc>

function! Reload()
    exec ":source ~/.config/nvim/init.vim"
endfunction
command! Reload call Reload(<f-args>)


" some more mappings
execute system('bash -lc "printenv VIM_EVAL"')


map <esc> <C-w><C-w>
map <tab> <C-w><C-w>
inoremap - _
inoremap _ -
map ; :

nnoremap <PageUp> <C-y>
nnoremap <PageDown> <C-e>
inoremap <PageUp> <C-X><C-y>
inoremap <PageDown> <C-X><C-e>


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
