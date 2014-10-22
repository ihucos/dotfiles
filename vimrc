
" boilerplate (do not edit) {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" }}}
" plugins {{{
" Plugin 'Lokaltog/powerline'
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'kana/vim-textobj-user'
" Plugin 'kien/ctrlp.vim'
" Plugin 'lokaltog/vim-easymotion'
Plugin 'morhetz/gruvbox' " a color scheme
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi' " readline like bindings in insert mode
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'buztard/vim-nomad'
Plugin 'chrisbra/csv.vim'
" Plugin 'bling/vim-airline'
" Plugin 'lilydjwg/colorizer'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/ZoomWin'
" Plugin 'jiangmiao/auto-pairs' "insert " ater ", ) after (
" Plugin 'python-rope/ropevim'
Plugin 'chriskempson/base16-vim'
Plugin 'sjl/gundo.vim' 
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'jszakmeister/vim-togglecursor' does not work in xterm with tmux
Plugin 'jnurmine/Zenburn' " a colorscheme
Plugin 'sheerun/vim-polyglot'
Plugin 'michaeljsmith/vim-indent-object' " ii / ai
Plugin 'mileszs/ack.vim' 
Plugin 'tpope/vim-eunuch' " TODO: document
Plugin 'matze/vim-move'
Plugin 'mikewest/vimroom'
Plugin 'sickill/vim-monokai'
Plugin 'tommcdo/vim-exchange'
Plugin 'airblade/vim-rooter'
Plugin 'kana/vim-arpeggio' " TODO: key chords: make something interesting with this
Plugin 'baskerville/bubblegum' " color scheme, I like it
Plugin 'koron/nyancat-vim'
Plugin 'wellle/targets.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jpo/vim-railscasts-theme'
" Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'hdima/python-syntax'
Plugin 'kana/vim-textobj-syntax' " y is a text object for syntax hilighted text
" Plugin 'gorkunov/smartpairs.vim'
" Plugin 'cakebaker/scss-syntax.vim' " seems not to work
Plugin 'Shougo/vimproc'
" Plugin 'gorodinskiy/vim-coloresque' " hilight color names
Plugin 'mhinz/vim-startify'
" }}}
" boilerplace (do not edit) {{{
call vundle#end()
filetype plugin indent on
syntax on
" }}}
" set {{{
" set nobackup
" set nowb
" set noswapfile 
" set showbreak=↪
set sidescrolloff=15
set sidescroll=1
set foldmethod=marker
set foldlevel=0
" set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default
set undofile
" set laststatus=2
set nowrap
set hidden
" set autochdir
set background=dark
set cursorline
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
set guioptions-=T guioptions-=m
set history=1000         " remember more commands and search history
" set hlsearch      " highlight search terms
set ignorecase    " ignore case when searching
set incsearch     " show search matches as you type
set number
set scrolloff=999   " Keep x lines below and above the cursor
set t_Co=256
set undolevels=1000      " use many muchos levels of undo
set lazyredraw
set ttyfast
set nomodeline
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" set noshowmode # enable later and show status in status bar
set nobackup
set nowb
set noswapfile

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

iabbrev @@ irae.hueck.costa@gmail.com
map <Tab> %

set list
set listchars=extends:▶,precedes:◀,trail:␣
set showbreak=┊
set splitbelow
set splitright

" swap an backup file related
set backup                        " enable backups
set noswapfile
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
" }}}
"
" maps {{{

" When typing %% expand it into the path to the current file
cnoremap %% <C-R>=expand('%:h') . '/'<cr>

" highlight WhitespaceEOL ctermbg=14
" match WhitespaceEOL /\s\+$/

" let mapleader = "\<Space>"
" let mapleader = ","
let mapleader = "4"
nmap 8 4

" TODO: only when esc whas pressed just before!
imap , <ESC>l
map , <ESC>
noremap <Space> a,<Space>
noremap <CR> a,<CR>
" noremap , a,
noremap 4 :echo 'mapleader command not found'<cr>

vmap > >gv
vmap < <gv

nnoremap j gj
nnoremap k gk
noremap gj j
noremap gk k

vnoremap J }
vnoremap K {
nnoremap J }
nnoremap K {
nnoremap H 5j
nnoremap L 5k
nnoremap <leader>K K
nnoremap <leader>J J
nnoremap <leader>H H
nnoremap <leader>L L

nnoremap Y y$
noremap gV `[v`]

" map <C-s> :w<cr>
" imap <C-s> <ESC>:w<cr>a
map <leader>s :w<cr>
map <leader>q :qa<cr>

nmap <Leader>y "+y
vmap <Leader>y "+y
nmap <Leader>Y "+Y
vmap <Leader>Y "+Y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

map <up> 2<C-w>+
map <down> 2<C-w>-
map <left> 2<C-w><
map <right> 2<C-w>>

inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" imap jk <Esc>
map q: :q<cr>
" }}}

" plugin indentline {{{
Plugin 'Yggdroot/indentLine' " vertical indentantion lines
let g:indentLine_char = '│'
let g:indentLine_color_term=0
" }}}
" plugin switch/toggle/bla {{{
" TODO: use plugins
let g:switch_custom_definitions =
\ [
\ ['white', 'black'],
\ ['right', 'left'],
\ ['top', 'bottom'],
\ ['red', 'blue'],
\ ['width', 'height'],
\ ['min', 'max'],
\ ['margin', 'padding'],
\ ['foo', 'bar', 'baz'],
\ ['block', 'inline-block', 'inline']
\ ]
" }}}
" plugin unite {{{
Plugin 'Shougo/unite.vim'
Plugin 'ujihisa/unite-locate'
Plugin 'Shougo/neomru.vim' " mru for unite
" FIXME: use file_rer/git when appropriate
map <leader>j :Unite -buffer-name=files -prompt-direction="top" -start-insert -no-split -wrap file_rec<cr>
" map <leader>r :Unite -buffer-name=mru -prompt-direction="top" -start-insert -winheight=20 file_mru<cr>
map <leader>k :Unite -buffer-name=buffers -no-split buffer:-<cr>
" map <leader>k :Unite -buffer-name=locate locate<cr>
map <leader>/ :Unite line -start-insert<cr>
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>

let g:unite_source_file_mru_limit = 100 " set up mru limit
call unite#custom#profile('default', 'context', { 'marked_icon':'✓'})
let g:unite_cursor_line_highlight = 'CursorLine'
let g:unite_prompt = '➜ ' " set up coolguy arrow prompt
call unite#filters#sorter_default#use(['sorter_rank']) " Use the rank sorter for everything

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ 'tmp/',
            \ ], '\|'))

if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    let b:SuperTabDisabled=1
    nmap <buffer> <ESC> <Plug>(unite_exit)
    " nmap <buffer> <C-P> <Plug>(unite_exit)
    " imap <buffer> <C-P> <Plug>(unite_exit)
    nmap <silent><buffer><expr> s unite#do_action('split')
    nmap <silent><buffer><expr> v unite#do_action('vsplit')
    nmap <silent><buffer><expr> t unite#do_action('tabopen')
endfunction
" }}}
" plugin vimroom {{{
" TODO: config, maybe not used. does not automatically go to fullscreen and is
" slow
let g:vimroom_sidebar_height=0
" }}}
" plugin clever-f {{{
Plugin 'rhysd/clever-f.vim'
let g:clever_f_mark_cursor = 0
let g:clever_f_mark_char_color='BetterF'
hi BetterF ctermfg=5 ctermbg=0
" }}}
" plugin tagbar {{{
Plugin 'majutsushi/tagbar'
nnoremap <Leader>t :Tagbar<cr>
" }}}
" plugin SingleCompile {{{
Plugin 'xuhdev/SingleCompile'
nmap <Leader>c :SCCompile<cr>
nmap <Leader>x :SCCompileRun<cr>
" }}}
" plugin jedi-vim {{{
Plugin 'davidhalter/jedi-vim'
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0
" }}}
" plugin tmux {{{
Plugin 'zaiste/tmux.vim'
let g:tmux_navigator_no_mappings = 1
inoremap <silent> <C-h> <ESC>:TmuxNavigateLeft<cr>a
inoremap <silent> <C-j> <ESC>:TmuxNavigateDown<cr>a
inoremap <silent> <C-k> <ESC>:TmuxNavigateUp<cr>a
inoremap <silent> <C-l> <ESC>:TmuxNavigateRight<cr>a
inoremap <silent> <C-\> <ESC>:TmuxNavigatePrevious<cr>a

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
" }}}
" plugin Syntastic {{{
Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']
autocmd BufEnter * :SyntasticCheck
hi SignColumn ctermbg=8
let g:syntastic_error_symbol = '✖'
let g:syntastic_warning_symbol = '✖'
let g:syntastic_style_warning_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'

au VimEnter * hi SyntasticErrorSign ctermfg=1 ctermbg=0
au VimEnter * hi SyntasticWarningSign ctermfg=9 ctermbg=0
au VimEnter * hi SyntasticStyleErrorSign ctermfg=12 ctermbg=0
au VimEnter * hi SyntasticStyleWarningSign ctermfg=12 ctermbg=0

au InsertLeave * hi SyntasticErrorSign ctermbg=0
au InsertLeave * hi SyntasticWarningSign ctermbg=0
au InsertLeave * hi SyntasticStyleErrorSign ctermbg=0
au InsertLeave * hi SyntasticStyleWarningSign ctermbg=0

au InsertEnter * hi SyntasticErrorSign ctermbg=10
au InsertEnter * hi SyntasticWarningSign ctermbg=10
au InsertEnter * hi SyntasticStyleErrorSign ctermbg=10
au InsertEnter * hi SyntasticStyleWarningSign ctermbg=10
" }}}

" gui/syntax/color stuff {{{
colo solarized

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Resize splits when the window is resized
au VimResized * :wincmd =

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[1 q\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"

" does not work?
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" awesome 80-character limiter
au FileType python :execute "set colorcolumn=" . join(range(81,335), ',')

hi Comment cterm=italic
hi PythonString cterm=bold,italic ctermfg=NONE ctermbg=NONE
hi NonText ctermbg=0 ctermbg=0
hi SpecialKey ctermbg=8 ctermfg=NONE
hi pythonImport ctermbg=NONE ctermfg=3 cterm=NONE
hi pythonFunction ctermbg=NONE ctermfg=2

hi pythonStatement   ctermbg=NONE ctermfg=4
hi pythonRepeat      ctermbg=NONE ctermfg=4
hi pythonConditional ctermbg=NONE ctermfg=4
hi pythonException   ctermbg=NONE ctermfg=4
hi pythonOperator    ctermbg=NONE ctermfg=4


augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
augroup END

au VimEnter * :hi SignColumn ctermbg=0
au VimEnter * :hi CursorLineNr ctermbg=10 ctermfg=0
au VimEnter * :hi clear CursorLine

au InsertLeave * :hi LineNr ctermfg=10 ctermbg=0 
au InsertEnter * :hi LineNr ctermfg=0 ctermbg=10 
au InsertLeave * :hi SignColumn ctermbg=0
au InsertEnter * :hi SignColumn ctermbg=10
" function s:PythonStuff()
"     au VimEnter * :hi PythonComment cterm=italic
"     au BufEnter * :hi PythonString cterm=italic,bold ctermbg=NONE ctermfg=12
"     au BufEnter * :hi PythonStatement cterm=bold ctermbg=NONE ctermfg=9
"     autocmd VimEnter * :syntax match Equal / = / " a hack, put this is after 
"     hi Equal ctermfg=7 
" endfunction
" au FileType python s:PythonStuff()




" autocmd BufEnter * :hi Conceal ctermfg= 
" =========================
" === some experimation ===
" =========================


" autocmd BufEnter * :syntax match Self /self\./ " a hack, put this is after 
" autocmd BufEnter * :syntax match Self /self\,/ " a hack, put this is after 
" hi Self ctermfg=11

" autocmd BufEnter * :syntax match Def /def/ " a hack, put this is after 
" hi Def ctermfg=11

" autocmd BufEnter * :syntax match Dot /\./ conceal cchar=▦ " a hack, put this is after 
" hi Dot ctermfg=0

" imap (【
" autocmd VimEnter * :syntax match Bra /(/ " a hack, put this is after 
" autocmd VimEnter * :syntax match Bra /)/ " a hack, put this is after 
" autocmd VimEnter * :syntax match Bra /*/ " a hack, put this is after 
" autocmd VimEnter * :syntax match Bra /,/ " a hack, put this is after 
" autocmd VimEnter * :syntax match Bra /\./ " a hack, put this is after 
" autocmd VimEnter * :hi Bra cterm=bold ctermfg=11

" always show syntastic sign column (https://gist.github.com/timonv/5115411)
" autocmd BufEnter * sign define dummy
" autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
"
" function! ColorizeSignColumn()
" python << endpython
" import vim, struct, hashlib
" fname = vim.eval("expand('%:t')")
" hash_byte = hashlib.sha1(fname).hexdigest()[0]
" fname_color = struct.unpack('B', hash_byte)[0]
" vim.command(":hi SignColumn ctermbg={}".format(fname_color))
" # vim.command("autocmd FileType python highlight ColorColumn ctermbg={}".format(fname_color))
" endpython
" endfunction
"
" autocmd BufEnter * :call ColorizeSignColumn()

" hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" custom highlighting modz
"
" hi String ctermbg=11 ctermfg=8
" hi String cterm=underline ctermfg=

" autocmd BufEnter * :syntax match Dot /\./ " a hack, put this is after 
" hi Dot ctermfg=0
"
" autocmd BufEnter * :syntax match Equal / = / " a hack, put this is after 
" hi Equal ctermfg=7 cterm=bold
"
"
" autocmd BufEnter * :syntax match Self /self\./ " a hack, put this is after 
" autocmd BufEnter * :syntax match Self /self\,/ " a hack, put this is after 
" hi Self ctermfg=11
"
" autocmd BufEnter * :hi pythonBuiltin ctermfg=12
"
"
" autocmd BufEnter * :syntax match ExitFunc / return / " a hack, put this is after 
" autocmd BufEnter * :syntax match ExitFunc / raise / " a hack, put this is after 
" autocmd BufEnter * : hi ExitFunc ctermfg=13
"
" autocmd BufEnter * :syntax match ExitFunc / raise / " a hack, put this is after 
"
" hi pythonFunction ctermfg=5
"
" " TODO: implement BoleanRelatedOperator
" autocmd BufEnter * :syntax match BoleanRelatedOperator / XXXXX / " a hack, put this is after 
"
"
"
" function SetBrowserWindow()
" python << endpython
" import vim, subprocess
" print 'select browser window to reload with :W'
" winid = subprocess.check_output(['xdotool', 'selectwindow']).strip('\n')
" print 'got window {}'.format(winid),
" vim.command("let g:winid = {}".format(winid))
" endpython
" endfunction
"
" function WriteAndReload()
" python << endpython
" import subprocess, vim
" from shlex import shlex
" winid = vim.eval('g:winid')
" # post save!
" subprocess.check_output(
"     ['xdotool', 'key',
"         '--window', winid, 'F5'])
" cmd = shlex('xev -event keyboard -id {} | grep -m 1 -q "(keysym 0xff1b, Escape)" && xmessage exited'.format(winid)) # security risk
" subprocess.Popen(cmd)
" endpython
" endfunction
"
" com! -bar W     cal WriteAndReload()
" com! -bar SetBrowserWindow     cal SetBrowserWindow()
" }}}
" misc {{{
" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" TODO: config ctags
" tags+=tags;$HOME

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}
" Baustelle {{{
" " The Silver Searcher
" if executable('ag')
"     " Use ag over grep
"     set grepprg=ag\ --nogroup\ --nocolor
"     " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"     " ag is fast enough that CtrlP doesn't need to cache
"     let g:ctrlp_use_caching = 0
" endif
" }}}
