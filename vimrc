execute pathogen#infect()

set nocompatible  

" set clipboard=unnamedplus

set cursorline
set expandtab
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                                    "    case-sensitive otherwise
"set smarttab     " insert tabs on the start of a line according to shiftwidth, not tabstop
set scrolloff=999   " Keep x lines below and above the cursor

nnoremap j gj
nnoremap k gk

set pastetoggle=<F2>

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType python set colorcolumn=80
" autocmd FileType python highlight ColorColumn ctermbg=239

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop> 
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" set viminfo='10,\"100,:20,%,n~/.viminfo

syntax on
filetype plugin indent on


set autochdir
let NERDTreeChDirMode=2
map <C-n> :NERDTreeToggle<CR>


map <C-m> :TlistToggle<CR>
let Tlist_WinWidth = 50
let Tlist_Use_Right_Window = 1
let Tlist_Display_Prototype = 1
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1

let g:ctrlp_working_path_mode = 'ra'

cmap w!! w !sudo tee % >/dev/null

" alternative for ESC
imap jk <Esc>

set guioptions-=T guioptions-=m
set background=dark

set t_Co=256
colo solarized
" set guifont=Inconsolata\ 12

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" jedi-vim and supertab
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0

" for easymotion
" map <Space> <Leader><Leader>
let g:EasyMotion_smartcase = 1
nmap , <Plug>(easymotion-s2)

" syntastic
let g:syntastic_python_checkers = ['pyflakes']

" always show syntastic sign column (https://gist.github.com/timonv/5115411)
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

function! ColorizeSignColumn()
python << endpython
import vim, struct, hashlib
fname = vim.eval("expand('%:t')")
hash_byte = hashlib.sha1(fname).hexdigest()[0]
fname_color = struct.unpack('B', hash_byte)[0]
vim.command(":hi SignColumn ctermbg={}".format(fname_color))
# vim.command("autocmd FileType python highlight ColorColumn ctermbg={}".format(fname_color))
endpython
endfunction

autocmd BufEnter * :call ColorizeSignColumn()

" hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

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

