" Plugin 'Shougo/vimproc'
Plugin 'airblade/vim-rooter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'buztard/vim-nomad'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'kana/vim-niceblock'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch' " TODO: document
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi' " readline like bindings in insert mode
Plugin 'tpope/vim-sleuth' " automaitc set indedation rules
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/matchit.zip'
Plugin 'wellle/targets.vim'
Plugin 'sheerun/vim-polyglot'


P4lugin 'rhysd/clever-f.vim'
let g:clever_f_mark_cursor = 0
let g:clever_f_mark_char_color='BetterF'
hi BetterF ctermfg=5 ctermbg=0


Plugin 'davidhalter/jedi-vim'
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_on_dot = 1
let g:jedi#use_tabs_not_buffers = 0
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns = {}
let g:neocomplete#force_omni_input_patterns.python =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'


Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

Plugin 'scrooloose/syntastic'
autocmd BufEnter * :SyntasticCheck
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_css_checkers = []
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--max-line-length=79"
let g:syntastic_error_symbol = '●'
let g:syntastic_warning_symbol = '●'
let g:syntastic_style_warning_symbol = '◌'
let g:syntastic_style_error_symbol = '◌'


" Plugin 'klen/python-mode'
" let g:pymode_rope = 0
" " let g:pymode_rope_lookup_project = 0
" let g:pymode_trim_whitespaces = 0
" let g:pymode_options = 0
" let g:pymode_options_colorcolumn = 0
" let g:pymode_lint = 0
" let g:pymode_virtualenv = 0
" let g:pymode_run = 0
" let g:pymode_syntax_indent_errors = 0

" let g:pymode_indent = 1
" let g:pymode_folding = 1
" let g:pymode_motion = 1
" let g:pymode_syntax = 1

" let g:pymode_doc = 1
" let g:pymode_doc_bind = '<leader>K'

" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_bind = '<leader>b'



Plugin 'fisadev/vim-isort'
let g:vim_isort_map = ''


Plugin 'KabbAmine/vCoolor.vim'
let g:vcoolor_map = '<nop>'
let g:vcool_ins_rgb_map = '<nop>'
let g:vcool_ins_hsl_map = '<nop>'
let g:vcool_ins_rgba_map = '<nop>'


Plugin 'mbbill/undotree'
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 35
let g:undotree_DiffAutoOpen = 1

Plugin 'Shougo/neocomplete.vim' " TODO: configure
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 5 " seems not to work :-/

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" FIXME: make switching with tab work
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


Plugin 'wesQ3/vim-windowswap'
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <C-W>s :call WindowSwap#EasyWindowSwap()<CR>
vnoremap <silent> <C-W>s :call WindowSwap#EasyWindowSwap()<CR>
