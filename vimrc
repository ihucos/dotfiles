set nocompatible              " be iMproved, required
filetype off                  " required

" required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" ### plugins ###
" Plugin 'Lokaltog/powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'morhetz/gruvbox' " a color scheme
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-expand-region' 
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi' " readline like bindings in insert mode
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'buztard/vim-nomad'
Plugin 'chrisbra/csv.vim'
" Plugin 'bling/vim-airline'
Plugin 'lilydjwg/colorizer'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/ZoomWin'
Plugin 'jiangmiao/auto-pairs' "insert " ater ", ) after (
" Plugin 'python-rope/ropevim'
Plugin 'https://github.com/chriskempson/base16-vim'
Plugin 'sjl/gundo.vim' 
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'jszakmeister/vim-togglecursor' does not work in xterm with tmux
Plugin 'jnurmine/Zenburn' " a colorscheme
Plugin 'sheerun/vim-polyglot'
Plugin 'michaeljsmith/vim-indent-object' " ii / ai
Plugin 'mileszs/ack.vim' 
Plugin 'xuhdev/SingleCompile'
Plugin 'majutsushi/tagbar'
Plugin 'rhysd/clever-f.vim'
Plugin 'tpope/vim-eunuch' " TODO: document
Plugin 'matze/vim-move'
Plugin 'mikewest/vimroom'
Plugin 'sickill/vim-monokai'
Plugin 'tommcdo/vim-exchange'
Plugin 'airblade/vim-rooter'
Plugin 'kana/vim-arpeggio' " TODO: key chords: make something interesting with this
Plugin 'Yggdroot/indentLine' " vertical indentantion lines
Plugin 'baskerville/bubblegum' " color scheme, I like it
Plugin 'fs111/pydoc.vim'


" required by Vundle
call vundle#end()
filetype plugin indent on

syntax on


" set nobackup
" set nowb
" set noswapfile 
" set showbreak=↪
set undofile
set ttyfast
set laststatus=2
set nowrap
set hidden
set autochdir
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

" let mapleader = "\<Space>"
let mapleader = ","

" test this one out
imap , <ESC>
noremap <Space> a,<Space>
" noremap , a,

" Asesome 80-character limiter
execute "set colorcolumn=" . join(range(81,335), ',')

vmap > >gv
vmap < <gv

nnoremap j gj
nnoremap k gk
nnoremap <Leader>o :CtrlP<CR>
nnoremap Y y$
noremap gV `[v`]

map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>a

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

noremap gV `[v`]

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop> 

inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>

map <BS> <Nop>
inoremap <BS> <Nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" imap jk <Esc>
map q: :q " common typo (seems not to work)

au VimEnter * :hi SignColumn ctermbg=0
au InsertLeave * :hi LineNr ctermfg=10 ctermbg=0 
au InsertEnter * :hi LineNr ctermfg=0 ctermbg=10 
au InsertLeave * :hi SignColumn ctermbg=0
au InsertEnter * :hi SignColumn ctermbg=10

colo solarized


" === config pydoc ===
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc

" === config vimroom ===
" TODO: config, maybe not used. does not automatically go to fullscreen and is
" slow
let g:vimroom_sidebar_height=0

" === config clever-vim-move ===
" TODO: config
let g:move_map_keys = 0
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <A-j> <Plug>MoveLineDown
nmap <A-k> <Plug>MoveLineUp

" === config clever-f ===
let g:clever_f_mark_cursor = 0
let g:clever_f_mark_char_color='BetterF'
hi BetterF ctermfg=5 ctermbg=0

" === config tagbar ===
nnoremap <Leader>t :Tagbar<CR>

" === config kien/rainbow_parentheses.vim ===
nmap <Leader>c :SCCompile<cr>
nmap <Leader>x :SCCompileRun<cr>

" === config kien/rainbow_parentheses.vim ===
" TODO: doit (make nice colors)

" === config Gundo ===
nmap <leader>u :GundoToggle<CR>

" === config easymotion ===
nmap <leader>j <Plug>(easymotion-bd-jk)
autocmd VimEnter * :unmap <leader><leader>
autocmd VimEnter * :nmap <leader><leader> <Plug>(easymotion-lineanywhere)

" " === config for airline ===
" let g:airline_theme='powerlineish'
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline_section_z=''
" autocmd VimEnter * :AirlineTheme solarized

" === config vim-expand-region === 
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ }

" === config nerdtree ===
let NERDTreeChDirMode=2
nmap <leader>m :NERDTreeToggle<CR>


" === config ctrlp ===
let g:ctrlp_working_path_mode = 'ra'

" === config jedi-vim and supertab ===
let g:jedi#auto_vim_configuration = 0
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0

" === config syntastic === 
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

" === config syntastic === 
let g:syntastic_python_checkers = ['flake8'] 
autocmd BufEnter * :SyntasticCheck
hi SignColumn ctermbg=8
let g:syntastic_error_symbol = '╳'
let g:syntastic_warning_symbol = '╳'
let g:syntastic_style_warning_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'

" TODO: better colors
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

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" TODO: config ctags
" tags+=tags;$HOME




" =========================
" === some experimation ===
" =========================

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
