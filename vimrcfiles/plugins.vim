
"     _ __   ___     ___ ___  _ __  / _|
"    | '_ \ / _ \   / __/ _ \| '_ \| |_
"    | | | | (_) | | (_| (_) | | | |  _|
"    |_| |_|\___/   \___\___/|_| |_|_|

" Plugin 'bling/vim-airline'
" Plugin 'cakebaker/scss-syntax.vim' " seems not to work
" Plugin 'gorkunov/smartpairs.vim'
" Plugin 'gorodinskiy/vim-coloresque' " hilight color names
" Plugin 'jiangmiao/auto-pairs' "insert " ater ", ) after (
" Plugin 'jszakmeister/vim-togglecursor' does not work in xterm with tmux
" Plugin 'kana/vim-textobj-syntax' " does not work well enough. y is a text object for syntax hilighted text
" Plugin 'kien/ctrlp.vim'
" Plugin 'lilydjwg/colorizer'
" Plugin 'lokaltog/vim-easymotion'
" Plugin 'mhinz/vim-startify'
" Plugin 'xolox/vim-easytags'

" vip:sort
Plugin 'Shougo/vimproc'
Plugin 'airblade/vim-rooter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'baskerville/bubblegum' " color scheme, I like it
Plugin 'buztard/vim-nomad'
Plugin 'chrisbra/csv.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'jnurmine/Zenburn' " a colorscheme
Plugin 'jpo/vim-railscasts-theme'
Plugin 'kana/vim-arpeggio' " TODO: key chords: make something interesting with this
Plugin 'kana/vim-textobj-user'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'koron/nyancat-vim'
Plugin 'matze/vim-move'
Plugin 'michaeljsmith/vim-indent-object' " ii / ai
Plugin 'mikewest/vimroom'
Plugin 'mileszs/ack.vim'
Plugin 'mjbrownie/django-template-textobjects'
Plugin 'morhetz/gruvbox' " a color scheme
Plugin 'sickill/vim-monokai'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors' " TODO: learn or remove from this list
Plugin 'tommcdo/vim-exchange'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-eunuch' " TODO: document
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi' " readline like bindings in insert mode
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/matchit.zip'
Plugin 'wellle/targets.vim'
Plugin 'xolox/vim-misc'



"             _ _   _                        __
"   __      _(_) |_| |__     ___ ___  _ __  / _|
"   \ \ /\ / / | __| '_ \   / __/ _ \| '_ \| |_
"    \ V  V /| | |_| | | | | (_| (_) | | | |  _|
"     \_/\_/ |_|\__|_| |_|  \___\___/|_| |_|_|


Plugin 'Shougo/unite.vim'
Plugin 'ujihisa/unite-locate'
Plugin 'Shougo/neomru.vim' " mru for unite
Plugin 'tsukkee/unite-tag'
let g:unite_force_overwrite_statusline = 0
let g:unite_source_file_mru_limit = 100 " set up mru limit
" call unite#custom#profile('default', 'context', { 'marked_icon':'✓'})
let g:unite_cursor_line_highlight = 'CursorLine'
let g:unite_prompt = '➜ '
" call unite#filters#sorter_default#use(['sorter_rank']) " Use the rank sorter for everything
" Set up some custom ignores
" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"             \ 'ignore_pattern', join([
"             \ '\.git/',
"             \ 'tmp/',
"             \ ], '\|'))
let g:unite_source_grep_max_candidates = 200
if executable('ag')
    let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'
endif
au WinLeave plugin-unite echo <plug>(unite_exit)


Plugin 'rhysd/clever-f.vim'
let g:clever_f_mark_cursor = 0
let g:clever_f_mark_char_color='BetterF'
hi BetterF ctermfg=5 ctermbg=0


Plugin 'davidhalter/jedi-vim'
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

Plugin 'scrooloose/syntastic'
autocmd BufEnter * :SyntasticCheck
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_css_checkers = []
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_error_symbol = '●'
let g:syntastic_warning_symbol = '●'
let g:syntastic_style_warning_symbol = '◌'
let g:syntastic_style_error_symbol = '◌'
au VimEnter * hi SyntasticErrorSign ctermfg=1 ctermbg=bg
au VimEnter * hi SyntasticWarningSign ctermfg=9 ctermbg=bg
au VimEnter * hi SyntasticStyleErrorSign ctermfg=12 ctermbg=bg
au VimEnter * hi SyntasticStyleWarningSign ctermfg=12 ctermbg=bg


Plugin 'Shougo/vimfiler.vim'
Plugin 'ton/vim-bufsurf'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_ignore_pattern = '\%(.pyc\)$'
let g:vimfiler_force_overwrite_statusline = 0


Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1


Plugin 'majutsushi/tagbar'
function! TagbarStatusFunc(current, sort, fname, flags, ...) abort
    return '%#StatusLineFile# [tagbar] ' . a:fname . ' %#StatusLine#'
endfunction
let g:tagbar_status_func = 'TagbarStatusFunc'


Plugin 'AndrewRadev/switch.vim'
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
            \ ['set', 'get'],
            \ ['true', 'false'],
            \ ['"', "'"],
            \ ['if', "else", 'elif'],
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


Plugin 'klen/python-mode'
let g:pymode_rope = 0
" let g:pymode_rope_lookup_project = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_options = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint = 0
let g:pymode_virtualenv = 0

let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_syntax = 1

let g:pymode_doc = 1
let g:pymode_doc_bind = '<leader>K'

let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'


Plugin 'sheerun/vim-polyglot' " this just needs to be under python-mode

