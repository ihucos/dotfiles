" set hlsearch      " highlight search terms
" set noshowmode " enable later and show status in status bar
" set number
" set numberwidth=
set background=dark
set backspace=indent,eol,start " bs: allows you to backspace over the listed character types
set backup " enable backups
set backupdir=~/.vim/tmp/backup//" backups
set completeopt=longest,menuone,preview " don't select first item, follow typing in autocomplete
set cursorline
set directory=~/.vim/tmp/swap// " swap files
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
set foldlevel=0
set foldmethod=marker
set guioptions-=Tm
set hidden
set history=1000 " remember more commands and search history
set ignorecase " ignore case when searching
set incsearch " show search matches as you type
set laststatus=2
set lazyredraw
set list
set listchars=extends:▶,precedes:◀,trail:␣,tab:⇥\ 
set mouse=a
set nobackup
set noerrorbells " No annoying sound on errors
set nofoldenable "dont fold by default
set nomodeline
set nospell
set noswapfile
set noswapfile
set notimeout
set novisualbell
set nowb
set nowrap
set scrolloff=999 " Keep x lines below and above the cursor
set showbreak=┊
set sidescroll=1
set sidescrolloff=15
set spelllang=en_us
set splitbelow
set splitright
set statusline=%#StatusLineFile#\ %t:%l\ %#StatusLine#
set t_Co=256
set t_vb=
set tabstop=4
set tags=.git/tags; " see http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
set tm=500
set ttimeout
set ttimeoutlen=10
set ttyfast
set undodir=~/.vim/tmp/undo// " undo files
set undofile
set undolevels=1000 " use many muchos levels of undo

set fillchars=fold:\ 
set fillchars+=fold:\⋅
set fillchars+=stlnc:─
set fillchars+=vert:│
set fillchars+=stl:─

