
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
" Plugin 'kana/vim-textobj-syntax' " does not work well enough. y is a text object for syntax hilighted text
" Plugin 'gorkunov/smartpairs.vim'
" Plugin 'cakebaker/scss-syntax.vim' " seems not to work
Plugin 'Shougo/vimproc'
" Plugin 'gorodinskiy/vim-coloresque' " hilight color names
" Plugin 'mhinz/vim-startify'
Plugin 'mjbrownie/django-template-textobjects'

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
 set laststatus=2
 set nowrap
 " set hidden
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
 " set number
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
 " set noshowmode " enable later and show status in status bar
 set nobackup
 set nowb
 set noswapfile
 
 " Time out on key codes but not mappings.
 " Basically this makes terminal Vim work sanely.
 set notimeout
 set ttimeout
 set ttimeoutlen=10
 
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

" maps {{{

 iabbrev @@ irae.hueck.costa@gmail.com

" When typing %% expand it into the path to the current file
 cnoremap %% <C-R>=expand('%:h') . '/'<cr>

" highlight WhitespaceEOL ctermbg=14
" match WhitespaceEOL /\s\+$/

 let mapleader = "\<Space>"
 noremap <Space> :echo '   **Command Not Found**'<cr>

 inoremap 1 <Esc>`^
 inoremap 2 <Esc>`^
 inoremap 3 <Esc>`^
 inoremap 4 <Esc>`^
 inoremap 5 <Esc>`^
 inoremap 6 <Esc>`^
 inoremap 7 <Esc>`^
 inoremap 8 <Esc>`^
 inoremap 9 <Esc>`^
 inoremap 0 <Esc>`^

 map 1 <Esc>
 map 2 <Esc>
 map 3 <Esc>
 map 4 <Esc>
 map 5 <Esc>
 map 6 <Esc>
 map 7 <Esc>
 map 8 <Esc>
 map 9 <Esc>
 map 0 <Esc>

 inoremap ,q 1
 inoremap ,w 2
 inoremap ,e 3
 inoremap ,r 4
 inoremap ,t 5
 inoremap ,y 6
 inoremap ,u 7
 inoremap ,i 8
 inoremap ,o 9
 inoremap ,p 0
 inoremap ,, ,

"  noremap ,a 0
"  noremap ,s 1
"  noremap ,d 2
"  noremap ,f 3
"  noremap ,g 4
"  noremap ,h 5
"  noremap ,j 6
"  noremap ,k 7
"  noremap ,l 8
"  noremap ,; 9
"  noremap ,, ,

 vmap > >gv
 vmap < <gv

 nnoremap j gj
 nnoremap k gk
 noremap gj j
 noremap gk k

 nnoremap m }}{w
 vnoremap m }
 nnoremap , {{{}}{w
 vnoremap , {

 nnoremap H ^
 nnoremap L $
 vnoremap H ^
 vnoremap L $
 onoremap H ^
 onoremap L $

 nnoremap <leader>m m

 nnoremap Y y$
 noremap gV `[v`]

 map <leader>w :w<cr>
 map <leader>w :w<cr>
 vmap <leader>q <ESC>:qa<cr>

 " TODO: integrate with tpopes undo plugin
 noremap p P`[v`]=
 noremap P p`[v`]=


 nmap <Leader>y "+y
 vmap <Leader>y "+y
 nmap <Leader>Y "+Y
 vmap <Leader>Y "+Y
 vmap <Leader>d "+d
 nmap <Leader>p "+p
 nmap <Leader>P "+P
 vmap <Leader>p "+p
 vmap <Leader>P "+P

 map <leader>s :split<cr>
 map <leader>v :vsplit<cr>

 nmap <leader>= mzgg=G\`z

 map <up> 2<C-w>+
 map <down> 2<C-w>-
 map <left> 2<C-w><
 map <right> 2<C-w>>
 imap <up> <ESC>2<C-w>+a
 imap <down> <ESC>2<C-w>-a
 imap <left> <ESC>2<C-w><a
 imap <right> <ESC>2<C-w>>a

 " Easy window navigation
 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <C-w>l

 " inoremap 4j (
 " inoremap 4k )
 " inoremap 4h [
 " inoremap 4l ]
 " inoremap 4n {
 " inoremap 4m }

 " inoremap 4j 1
 " inoremap 4k 2
 " inoremap 4l 3
 " inoremap 4y 4
 " inoremap 4u 5
 " inoremap 4i 6
 " inoremap 4o 7
 " inoremap 4n 8
 " inoremap 4m 9

 " noremap 11 !
 " noremap 22 @
 " noremap 33 #
 " noremap 44 $
 " noremap 55 %
 " noremap 66 ^
 " noremap 77 &
 " noremap 88 *
 " noremap 99 (
 " noremap 00 )


 map q: :q<cr> " common typo

" }}}

" plugin indentline {{{
Plugin 'Yggdroot/indentLine' " vertical indentantion lines
let g:indentLine_char = '│'
let g:indentLine_color_term=0
" }}}
" plugin switch {{{
Plugin 'AndrewRadev/switch.vim'
" noremap <tab> :Switch<cr> " tab == ctrl+I in vim :-(
let g:switch_custom_definitions =
\ [
\ ['white', 'black'],
\ ['right', 'left'],
\ ['top', 'bottom'],
\ ['#000000', '#FFFFFF'],
\ ['#000', '#FFF'],
\ ['width', 'height'],
\ ['min', 'max'],
\ ['margin', 'padding'],
\ ['foo', 'bar', 'baz'],
\ ['block', 'inline-block', 'inline'],
\ ['static', 'absolute', 'fixed', 'relative'],
\ ['def', 'class'],
\ ['request', 'response'],
\ ['GET', 'POST'],
\ ['(', '[', '{'],
\ [')', ']', '}'],
\ ['return', 'yield'],
\ ['True', 'False'],
\ ['0', '1'],
\ ['yes', 'no'],
\ ['on', 'off'],
\ ['true', 'false'],
\ ['"', "'"],
\ ['if', "else", 'elsif'],
\ ['try', "except", 'finally'],
\ ['import', 'from'],
\ ['==', '!='],
\ ['is', 'is not'],
\ ['+', '-'],
\ ['&&', '||'],
\ ['id', 'class'],
\ ['ul', 'li'],
\ ['\\', '/'],
\ ['?', '!'],
\ ['<', '>'],
\ ['div', 'span', 'p'],
\ ['hate', 'love'],
\ ]

" }}}
" plugin unite {{{

Plugin 'Shougo/unite.vim'
Plugin 'ujihisa/unite-locate'
Plugin 'Shougo/neomru.vim' " mru for unite
Plugin 'tsukkee/unite-tag'


" FIXME: use file_rer/git when appropriate
map <leader>f :Unite -buffer-name=files -prompt-direction="top" -start-insert -no-split -wrap file_rec<cr>
" map <leader>r :Unite -buffer-name=mru -prompt-direction="top" -start-insert -winheight=20 file_mru<cr>
map <leader>k :Unite -buffer-name=buffers -no-split buffer:-<cr>
map <leader>/ :Unite -buffer-name=locate -no-split -start-insert line<cr>
" map <leader>h :Unite -buffer-name=xxx -no-split -start-insert locate<cr>
map <leader>l :Unite -buffer-name=register register<CR>
map <leader>j :Unite -buffer-name=tag -start-insert -no-split -wrap tag<cr>

let g:unite_source_file_mru_limit = 100 " set up mru limit
call unite#custom#profile('default', 'context', { 'marked_icon':'✓'})
let g:unite_cursor_line_highlight = 'CursorLine'
let g:unite_prompt = '➜ '
call unite#filters#sorter_default#use(['sorter_rank']) " Use the rank sorter for everything

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ 'tmp/',
            \ ], '\|'))

let g:unite_source_grep_max_candidates = 200

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
    \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt in unite grep source.
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack in unite grep source
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
    \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    let b:SuperTabDisabled=1
    nmap <buffer> <ESC> <Plug>(unite_exit)
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

autocmd BufEnter * :SyntasticCheck

let g:syntastic_css_checkers = []
let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_scss_scss_lint_args = ['']
" let g:syntastic_error_symbol = '✖'
" let g:syntastic_warning_symbol = '✖'
let g:syntastic_error_symbol = '●'
let g:syntastic_warning_symbol = '●'
let g:syntastic_style_warning_symbol = '◌'
let g:syntastic_style_error_symbol = '◌'

au VimEnter * hi SyntasticErrorSign ctermfg=1 ctermbg=bg
au VimEnter * hi SyntasticWarningSign ctermfg=9 ctermbg=bg
au VimEnter * hi SyntasticStyleErrorSign ctermfg=12 ctermbg=bg
au VimEnter * hi SyntasticStyleWarningSign ctermfg=12 ctermbg=bg

" " FIXME: code duplication
" au InsertLeave * hi SyntasticErrorSign ctermfg=1 ctermbg=bg
" au InsertLeave * hi SyntasticWarningSign ctermfg=9 ctermbg=bg
" au InsertLeave * hi SyntasticStyleErrorSign ctermfg=12 ctermbg=bg
" au InsertLeave * hi SyntasticStyleWarningSign ctermfg=12 ctermbg=bg

" au InsertEnter * hi SyntasticErrorSign ctermbg=bg ctermfg=0
" au InsertEnter * hi SyntasticWarningSign ctermbg=bg ctermfg=0
" au InsertEnter * hi SyntasticStyleErrorSign ctermbg=bg ctermfg=0
" au InsertEnter * hi SyntasticStyleWarningSign ctermbg=bg ctermfg=0

" au InsertEnter * hi SyntasticErrorSign ctermbg=10
" au InsertEnter * hi SyntasticWarningSign ctermbg=10
" au InsertEnter * hi SyntasticStyleErrorSign ctermbg=10
" au InsertEnter * hi SyntasticStyleWarningSign ctermbg=10

" }}}
" plugin vimfiler {{{
Plugin 'Shougo/vimfiler.vim'
Plugin 'ton/vim-bufsurf'

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

autocmd FileType vimfiler call s:exit_on_esc()
map <leader>d :VimFiler<cr>T

" }}}

" gui/syntax/color stuff {{{
colo solarized

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Resize splits when the window is resized
au VimResized * :wincmd =

" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[1 q\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"

" awesome 80-character limiter
execute "set colorcolumn=" . join(range(81,335), ',')
hi ColorColumn ctermbg=0
" au BufLeave * :hi ColorColumn ctermbg=bg
" au BufEnter * :hi ColorColumn ctermbg=0

hi CursorLineNr ctermfg=0 ctermbg=3 cterm=bold
hi CursorLine ctermbg=1
hi LineNr cterm=italic,bold
hi MatchParen cterm=bold ctermbg=NONE ctermfg=5
hi Comment cterm=italic
hi PythonString cterm=bold,italic ctermfg=NONE ctermbg=NONE
hi NonText ctermbg=0 ctermbg=0
hi SpecialKey ctermbg=8 ctermfg=NONE
hi NonText ctermbg=bg
hi Folded ctermbg=bg cterm=NONE ctermbg=bg ctermfg=14
hi Visual ctermfg=12 ctermbg=bg
hi ModeMsg ctermbg=3 ctermfg=bg
hi Todo ctermfg=3

hi pythonImport ctermbg=NONE ctermfg=3 cterm=NONE
hi pythonFunction ctermbg=NONE ctermfg=2
hi pythonStatement   ctermbg=NONE ctermfg=4
hi pythonRepeat      ctermbg=NONE ctermfg=4
hi pythonConditional ctermbg=NONE ctermfg=4
hi pythonException   ctermbg=NONE ctermfg=4
hi pythonOperator    ctermbg=NONE ctermfg=4

set statusline=%#StatusLineFile#%t:%l\ %#StatusLine#)
hi StatusLineFile ctermbg=fg ctermfg=bg
" italic is a hack, statuslineNC and statusline cant be the same hilight
hi StatusLineNC ctermbg=14 ctermfg=bg cterm=italic 
hi StatusLine ctermbg=14 ctermfg=bg
hi VertSplit ctermfg=14 ctermbg=bg

set fillchars=stl:━
set fillchars+=stlnc:━
set fillchars+=vert:┃
set fillchars+=fold:\ 
set fillchars+=fold:\⋅

au InsertLeave * :hi LineNr ctermfg=10 ctermbg=0
au InsertEnter * :hi LineNr ctermfg=0 ctermbg=0

augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
augroup END

au VimEnter * :hi SignColumn ctermbg=bg
au VimEnter * :hi clear CursorLine

autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" au InsertEnter * :hi ModeMsg ctermfg=bg ctermbg=5
" " au InsertChange * :hi ModeMsg ctermfg=bg ctermbg=5
" au InsertLeave * :hi ModeMsg ctermfg=fg ctermbg=bg


" au InsertLeave * :hi SignColumn ctermbg=0
" au InsertEnter * :hi SignColumn ctermbg=10

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

set tags=.git/tags;

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

" taken from http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompt
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" command! BrowserReload
"     :Silent python ~/projects/wintoggle.py hide<cr>

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

autocmd FileType help call s:quit_window()
function! s:exit_on_esc()
    nmap <buffer> <ESC> :BufSurfBack<cr> " TODO: implement
endfunction

function! s:exit_on_esc()
    nmap <buffer> <ESC> :BufSurfBack<cr>
endfunction

function! s:MyHelp(arg)
    exe ":tab h ".a:arg
endfunction
command! -nargs=1 H call s:MyHelp(<f-args>)
