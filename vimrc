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
Plugin 'zaiste/tmux.vim'
Plugin 'koron/nyancat-vim'
Plugin 'wellle/tmux-complete.vim.git' " TODO: configure with supertab
Plugin 'wellle/targets.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'


" required by Vundle
call vundle#end()
filetype plugin indent on

syntax on

" map 11 !
" map 22 @
" map 33 #
" map 44 $
" map 55 %
" map 66 ^
" map 77 &
" map 88 *
" map 99 (
" map 00 )

" imap 99 )
" imap 88 (
" map 88 (
" imap 99 )

" set nobackup
" set nowb
" set noswapfile 
" set showbreak=↪
set sidescrolloff=15
set sidescroll=1
set foldmethod=indent "fold based on indent
" set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default
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

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10


vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
iabbrev ihcm irae.hueck.costa@gmail.com
map <Tab> %

set list
set listchars=extends:┣,precedes:┫,trail:␣
set showbreak=┊

" does not work?
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

highlight WhitespaceEOL ctermbg=0  
match WhitespaceEOL /\s\+$/

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
noremap gj j
noremap gk k

nnoremap Y y$
noremap gV `[v`]

" map <C-s> :w<cr>
" imap <C-s> <ESC>:w<cr>a
map <leader>s :w<cr>
map <leader>q :qa<cr>

nmap <Leader>y "+y
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

" Resize splits when the window is resized
au VimResized * :wincmd =

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


colo solarized

" === indentline ===
let g:indentLine_char = '│' 
let g:indentLine_color_term=0
"
" === swap an backup file related ===
set backup                        " enable backups
set noswapfile

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

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
nnoremap <Leader>t :Tagbar<cr>

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

" " " === config for airline ===
" let g:airline_theme='solarized'
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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <Leader><space>f :CtrlP<CR>
nnoremap <Leader><space>t :CtrlPTag<CR>
nnoremap <Leader><space>b :CtrlPBufTagAll<CR>


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

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" TODO: config ctags
" tags+=tags;$HOME

" TODO: think about this one
" Kill window
nnoremap K :q<cr>
" Man
nnoremap M K

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

autocmd VimEnter * :syntax match Equal / = / " a hack, put this is after 
hi Equal ctermfg=7 

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


" = maybe there is a plugin for that
" }}}
" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195




" Ack motions {{{  

" Motions to Ack for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

nnoremap <silent> <leader>A :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> <leader>A :<C-U>call <SID>AckMotion(visualmode())<CR>

nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>
xnoremap <silent> <bs> :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

" ========= misc ========
au VimEnter * :hi PythonComment cterm=italic
au BufEnter * :hi PythonString cterm=italic,bold ctermbg=NONE ctermfg=12
au BufEnter * :hi PythonStatement cterm=bold ctermbg=NONE ctermfg=9
