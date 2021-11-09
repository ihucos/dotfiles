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


function! RunFloat(cmd)
    exec "FloatermNew --title=━ --borderchars=━┃━┃┏┓┛┗ --width=0.8 --height=0.90 --autoclose=1 bash -lc '".a:cmd."'"
endfunction

function! RunFloat2(cmd)
    exec "FloatermNew --title=━ --borderchars=━┃━┃┏┓┛┗ --width=0.95 --height=0.90 --autoclose=2 bash -lc '".a:cmd."'"
endfunction

function! RunFloat0(cmd)
    exec "FloatermNew --title=━ --borderchars=━┃━┃┏┓┛┗ --width=0.95 --height=0.90 --autoclose=0 bash -lc '".a:cmd."'"
endfunction

function! RunFloatBig(cmd)
    exec "FloatermNew --title=━ --borderchars=━┃━┃┏┓┛┗ --width=0.95 --height=0.95 --autoclose=1 bash -lc '".a:cmd."'"
endfunction

command! -nargs=1 RunFloat call RunFloat(<f-args>)
command! -nargs=1 RunFloat2 call RunFloat2(<f-args>)
command! -nargs=1 RunFloat0 call RunFloat0(<f-args>)
command! -nargs=1 RunFloatBig call RunFloatBig(<f-args>)


execute $VIM_EVAL





noremap <leader>o :w<CR>
" nnoremap <leader>ob :e ~/.bashrc<CR>
" nnoremap <leader>ov :e ~/.config/nvim/init.vim<CR>

noremap <leader>x :tabnew<CR>:terminal<CR>A
noremap <leader>c :tabnew<CR>:terminal<CR>A
noremap <leader>gd :!git diff<CR>
noremap <leader>gs :!git status -s<CR>
noremap <leader>gc :!git commit -am ""<left>
noremap <leader>gp :!git push<CR>
noremap <leader>gg :!git<space>
noremap <leader>v :source ~/.config/nvim/init.vim<CR>
noremap <leader>w <C-w>
noremap <leader>tt :let @a=expand("%:p")<CR>:tabnew<CR>:terminal<CR>ihans test --tb=native<space><C-\><C-N>"api
" noremap <leader>tf :!hans exec --tb=native <C-r>=expand('%')<CR><space>
noremap <leader>b :!plash --from ubuntu:focal --apt python3-pip -l --pip3 black==19.10b0 -- /usr/local/bin/black %:p<CR>
noremap <leader>i :!isort  --skip venv3 --skip venv --skip venv2 --skip migrations --settings-path setup.cfg %:p
noremap <leader>r :<Up><CR>
map <leader><leader> <C-w><C-w>

map <leader>w <C-w>
map <leader><leader> <C-w><C-w>
map <esc> <C-w><C-w>




inoremap - _
inoremap _ -
map ; :





function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

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
