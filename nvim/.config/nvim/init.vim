call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'ambv/black'
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-commentary'
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
hi LineNr ctermbg=black ctermfg=10
hi link NormalFloat Normal


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

tnoremap <esc><esc> <C-\><C-n>
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

command! -nargs=1 RunFloat call RunFloat(<f-args>)
command! -nargs=1 RunFloat2 call RunFloat2(<f-args>)
command! -nargs=1 RunFloat0 call RunFloat0(<f-args>)

function! Reload()
    exec ":source ~/.config/nvim/init.vim"
endfunction
command! Reload call Reload(<f-args>)


" some more mappings
" execute system('bash -lc "printenv VIM_EVAL"')






map <esc> <C-w><C-w>
map <tab> <C-w><C-w>
" map <leader><leader> <C-w><C-w>
" map <leader>w <C-w>
" map <leader>r :<Up><CR>




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









function! Float() abort
    " Create the scratch buffer displayed in the floating window

    let cmd = 'python3 ~/verbs/verbs.py '.expand('%:p').' '.expand(line('.')).' '.expand('<cword>').' '

    let g:floatbuf = nvim_create_buf(v:false, v:true)

    " Get the current UI
    let ui = nvim_list_uis()[0]

    " Define the size of the floating window
    let width = ui.width - 20
    let height = ui.height - 10

    " Create the floating window
    let opts = {'relative': 'editor',
                \ 'width': width,
                \ 'height': height,
                \ 'col': (ui.width/2) - (width/2),
                \ 'row': (ui.height/2) - (height/2),
                \ 'anchor': 'NW',
                \ 'style': 'minimal',
                \ }
    let float = nvim_open_win(g:floatbuf, 1, opts)
    exe 'term '.cmd

    normal i
endfunction
command! Float call Float()


function! FloatClose()
	silent! execute 'bdelete! '.g:floatbuf 
endfunction
command! FloatClose call FloatClose()

noremap <leader>  :Float<cr>
" autocmd TermClose * bdelete
