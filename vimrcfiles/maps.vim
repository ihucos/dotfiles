let mapleader = "\<Space>"
 " allow holding down the leader key like a modfier key
map <leader><leader> <leader>
let maplocalleader = "\\"




" === EXPERIMENTAL STUFF HERE ===
" maybe make this flexible with ctags. ctags jump to next definition
" map J ]M
" map K [M

noremap ; :

noremap J 5j
noremap K 5k

noremap <C-j> 5jzz
noremap <C-k> 5kzz
noremap <C-l> zb
noremap <C-h> zt

" TODO: do something nice with C-c
" map <C-c> ]M
" map <C-x> [M

" Clear highlight.
nnoremap <ESC><ESC> :nohlsearch<CR>:match<CR>



" ===============================

" nice extra stuff
" noremap <CR> mzo<ESC>`z
" noremap <BS> mzO<ESC>`z
noremap <silent> <CR> :Flash<cr>
noremap <silent> <BS> :Flash<cr>
nnoremap Y y$

" select text just pasted
nnoremap gV `[v`]
"
" Disable Ex-mode.
nnoremap Q q

" Restore case-sensitivity for jumping to tags (set ic disables it)
map <silent> <C-]> :set noic<cr>g<C-]><silent>:set ic<cr>

" macro and repeat command also in visual mode
vnoremap <leader>. :normal .<cr>
vnoremap <leader>@ :normal @

nnoremap j gj
nnoremap k gk
noremap gj j
noremap gk k


nnoremap p ]P`]
nnoremap P ]p`]
vnoremap p ]P`]
vnoremap P ]p`]

" go a paragraph up or down
" TODO: add support for motions
nnoremap m }}{w
vnoremap m }
nnoremap , {{{}}{w
vnoremap , {

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
onoremap H ^
onoremap L $

" NIMM: Allow undoing insert-mode ctrl-u and ctrl-w
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" resize windows
noremap <up> 2<C-w>+
noremap <down> 2<C-w>-
noremap <left> 2<C-w><
noremap <right> 2<C-w>>
inoremap <up> <ESC>2<C-w>+a
inoremap <down> <ESC>2<C-w>-a
inoremap <left> <ESC>2<C-w><a
inoremap <right> 2<C-w>>a

"     _                _
"    | | ___  __ _  __| | ___ _ __   _ __ ___   __ _ _ __  ___
"    | |/ _ \/ _` |/ _` |/ _ \ '__| | '_ ` _ \ / _` | '_ \/ __|
"    | |  __/ (_| | (_| |  __/ |    | | | | | | (_| | |_) \__ \
"    | |\___|\__,_|\__,_|\___|_|    |_| |_| |_|\__,_| .__/|___/
"    |_|

vnoremap <leader>a :<C-u>call Pep8FixVisual()<cr>
nnoremap <leader>a :<C-u>call Pep8FixLine()<cr>

" Reload .vimrc
map <leader>r :source ~/.vimrc<cr>

" Unfuck my screen
nnoremap <leader>U :syntax sync fromstart<cr>:redraw!<cr>

" map remapped standart mapping with leader
nnoremap <leader>m m
nnoremap <leader>J J
nnoremap <leader>K K

map <leader>x cc<ESC>
map <leader>c <leader>mzgcip`z<ESC>

map <leader>w :w<cr>
vmap <leader>w :w<cr>
map <leader>q :qa<cr>
vmap <leader>q :<C-u>qa<cr>

" 'normal' copy paste with
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>Y "+Y
vmap <leader>Y "+Y
vmap <leader>d "+d
vmap <leader>D "+D
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

noremap <silent> <leader>j :split<cr>:call MultiPurposeUnite()<cr>
noremap <silent> <leader>k :split<cr><C-w>k:call MultiPurposeUnite()<cr>
noremap <silent> <leader>h :vsplit<cr><C-w>h:call MultiPurposeUnite()<cr>
noremap <silent> <leader>l :vsplit<cr>:call MultiPurposeUnite()<cr>

omap <leader>= mzgg=G\`z

"     _
"    (_)_ __ ___   __ _ _ __  ___
"    | | '_ ` _ \ / _` | '_ \/ __|
"    | | | | | | | (_| | |_) \__ \
"    |_|_| |_| |_|\__,_| .__/|___/
"                      |_|


" convention is to use the last letter twice
iabbrev maill irae.hueck.costa@gmail.com
iabbrev ipyy import IPython; IPython.embed()
iabbrev iraee Irae Hueck Costa

" expand %% to path of the current file when writing an vim command
cnoremap %% <C-R>=expand('%:h') . '/'<cr>

" any number exits insert mode
inoremap 1 <Esc>`^;
inoremap 2 <Esc>`^
inoremap 3 <Esc>`^
inoremap 4 <Esc>`^
inoremap 5 <Esc>`^
inoremap 6 <Esc>`^
inoremap 7 <Esc>`^
inoremap 8 <Esc>`^
inoremap 9 <Esc>`^
inoremap 0 <Esc>`^

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang Q1 q!<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>
command! -bang WQ wq<bang>
cnoreabbrev wQ wq
cnoreabbrev Wq wq
nmap <F1> <Esc>

"           _             _
"     _ __ | |_   _  __ _(_)_ __    _ __ ___   __ _ _ __  ___
"    | '_ \| | | | |/ _` | | '_ \  | '_ ` _ \ / _` | '_ \/ __|
"    | |_) | | |_| | (_| | | | | | | | | | | | (_| | |_) \__ \
"    | .__/|_|\__,_|\__, |_|_| |_| |_| |_| |_|\__,_| .__/|___/
"    |_|            |___/                          |_|


" utility function
function! UnmapEssentialsFromBuffer()
  silent! unmap <buffer> <leader>

  silent! unmap <buffer> <C-j>
  silent! unmap <buffer> <C-k>
  silent! unmap <buffer> <C-h>
  silent! unmap <buffer> <C-l>

  silent! iunmap <buffer> <C-j>
  silent! iunmap <buffer> <C-k>
  silent! iunmap <buffer> <C-h>
  silent! iunmap <buffer> <C-l>

  silent! unmap <buffer> <up>
  silent! unmap <buffer> <down>
  silent! unmap <buffer> <left>
  silent! unmap <buffer> <right>

  silent! iunmap <buffer> <up>
  silent! iunmap <buffer> <down>
  silent! iunmap <buffer> <left>
  silent! iunmap <buffer> <right>

endfunction
autocmd FileType vimfiler call UnmapEssentialsFromBuffer()
autocmd FileType unite call UnmapEssentialsFromBuffer()


function! MyUnite(source, buffer_name, extra)
  execute 'Unite ' . a:source . ' -buffer-name=' . a:buffer_name . ' -no-split -winheight=' . winheight(0) . ' ' . a:extra

endfunction
function! MultiPurposeUnite()
    call MyUnite('buffer:- tag file_rec/git', 'multipurpose', '-start-insert -short-source-names')
endfunction
noremap <leader>u :call MultiPurposeUnite()<cr>
noremap <leader>/ :call MyUnite('line:wrap', 'line', '-start-insert')<cr>
noremap <leader>g :call MyUnite('grep:.', 'grep', '')<cr>
noremap <leader>o :call MyUnite('outline', 'outline', '')<cr>
noremap <leader>sf :call MyUnite('filetype filetype/new', 'filetype', '-start-insert')<cr>
noremap <leader>sr :call MyUnite('register history/yank', 'register', '-start-insert')<cr>
noremap <leader>su :call MyUnite('menu:utils', 'menu-utils', '')<cr>

noremap <leader>su :UndotreeToggle<cr>

noremap <silent> <leader>vc :VimuxPromptCommand<cr>
noremap <silent> <leader>vv :VimuxRunLastCommand<cr>
noremap <silent> <leader>vx :VimuxCloseRunner<cr>
noremap <silent> <leader>vi :VimuxInspect<cr>
noremap <silent> <Leader>vz :call VimuxZoomRunner()<CR>

" noremap <leader>j :call MyUnite('tag', 'tag', '-start-insert')<cr>
" noremap <leader>k :call MyUnite('buffer:-', 'buffer', '')<cr>
" noremap <leader>f :call MyUnite('file_rec/async', 'file_rec', '-start-insert')<cr>

"
" map <leader>f :Unite -buffer-name=files -start-insert -no-split -wrap file_rec -wipe<cr>
" map <leader>r :Unite -buffer-name=mru -prompt-direction="top" -start-insert -winheight=20 file_mru<cr>
" map <leader>k :Unite -buffer-name=buffers -no-split buffer:- -wipe<cr>
" map <leader>/ :Unite -buffer-name=locate -no-split -start-insert line -wipe<cr>
" " map <leader>h :Unite -buffer-name=xxx -no-split -start-insert locate<cr>
" map <leader>l :Unite -buffer-name=register register<CR>
" map <leader>j :Unite -buffer-name=tag -start-insert -no-split -wrap tag -wipe<cr>
" " Custom mappings for the unite buffer

map <leader>f :VimFilerCreate<cr>

nnoremap <Leader>t :Tagbar<cr>

" FIMXE: use other than C-x as prefix
nnoremap <silent> <C-x><C-h> zH:TmuxNavigateLeft<cr>zH
nnoremap <silent> <C-x><C-j> zH:TmuxNavigateDown<cr>
nnoremap <silent> <C-x><C-k> zH:TmuxNavigateUp<cr>
nnoremap <silent> <C-x><C-l> zH:TmuxNavigateRight<cr>

inoremap <silent> <C-x><C-h> <ESC>lzH:TmuxNavigateLeft<cr>
inoremap <silent> <C-x><C-j> <ESC>lzH:TmuxNavigateDown<cr>
inoremap <silent> <C-x><C-k> <ESC>lzH:TmuxNavigateUp<cr>
inoremap <silent> <C-x><C-l> <ESC>lzH:TmuxNavigateRight<cr>

vnoremap <silent> <C-x><C-h> <ESC>zH:TmuxNavigateLeft<cr>gv
vnoremap <silent> <C-x><C-j> <ESC>zH:TmuxNavigateDown<cr>gv
vnoremap <silent> <C-x><C-k> <ESC>zH:TmuxNavigateUp<cr>gv
vnoremap <silent> <C-x><C-l> <ESC>zH:TmuxNavigateRight<cr>gv

" see why we need <C-c>: http://superuser.com/questions/739971/how-to-properly-remap-del-to-esc-in-vim)
cnoremap <silent> <C-x><C-h> <C-c>zH:TmuxNavigateLeft<cr>
cnoremap <silent> <C-x><C-j> <C-c>zH:TmuxNavigateDown<cr>
cnoremap <silent> <C-x><C-k> <C-c>zH:TmuxNavigateUp<cr>
cnoremap <silent> <C-x><C-l> <C-c>zH:TmuxNavigateRight<cr>

" unmap mapping from vim-rooter
au VimEnter * unmap <leader>cd

" function! UniteTmuxNavigteOverwrite()
"   inoremap <silent> <C-h> <ESC>:execute "normal \<plug>(unite_exit)"<cr>:TmuxNavigateLeft<cr>
"   inoremap <silent> <C-j> <ESC>:execute "normal \<plug>(unite_exit)"<cr>:TmuxNavigateDown<cr>
"   inoremap <silent> <C-k> <ESC>:execute "normal \<plug>(unite_exit)"<cr>:TmuxNavigateUp<cr>
"   inoremap <silent> <C-l> <ESC>:execute "normal \<plug>(unite_exit)"<cr>:TmuxNavigateRight<cr>
" endfunction
"
" " exit this sort of buffers with ESC
" autocmd FileType unite call UniteTmuxNavigteOverwrite()
" autocmd FileType unite map <buffer> <ESC> <plug>(unite_exit)
autocmd FileType help map <buffer> q :b#<bar>bd#<CR>
autocmd FileType vimfiler map <buffer> q :b#<bar>bd#<CR>


"  _   _                 _                                 _____ ____   ____
" | \ | |_   _ _ __ ___ | |__   ___ _ __ ___    __ _ ___  | ____/ ___| / ___|
" |  \| | | | | '_ ` _ \| '_ \ / _ \ '__/ __|  / _` / __| |  _| \___ \| |
" | |\  | |_| | | | | | | |_) |  __/ |  \__ \ | (_| \__ \ | |___ ___) | |___
" |_| \_|\__,_|_| |_| |_|_.__/ \___|_|  |___/  \__,_|___/ |_____|____/ \____|
"

map 1 <ESC>
map 2 <ESC>
map 3 <ESC>
map 4 <ESC>
map 5 <ESC>
map 6 <ESC>
map 7 <ESC>
map 8 <ESC>
map 9 <ESC>

" we have to use <C-c> instead of <ESC> as a workaround
" (see http://superuser.com/questions/739971/how-to-properly-remap-del-to-esc-in-vim)
cnoremap 0 <C-c>
cnoremap 1 <C-c>
cnoremap 2 <C-c>
cnoremap 3 <C-c>
cnoremap 4 <C-c>
cnoremap 5 <C-c>
cnoremap 6 <C-c>
cnoremap 7 <C-c>
cnoremap 8 <C-c>
cnoremap 9 <C-c>

cnoremap <C-c>0 0
cnoremap <C-c>1 1
cnoremap <C-c>2 2
cnoremap <C-c>3 3
cnoremap <C-c>4 4
cnoremap <C-c>5 5
cnoremap <C-c>6 6
cnoremap <C-c>7 7
cnoremap <C-c>8 8
cnoremap <C-c>9 9
cmap <C-c><C-c> <C-c> " makes holding down C-c for a longer than one keypress possible


inoremap <C-c>0 0
inoremap <C-c>1 1
inoremap <C-c>2 2
inoremap <C-c>3 3
inoremap <C-c>4 4
inoremap <C-c>5 5
inoremap <C-c>6 6
inoremap <C-c>7 7
inoremap <C-c>8 8
inoremap <C-c>9 9
imap <C-c><C-c> <C-c> " makes holding down C-c for a longer than one keypress possible

noremap <C-c>0 0
noremap <C-c>1 1
noremap <C-c>2 2
noremap <C-c>3 3
noremap <C-c>4 4
noremap <C-c>5 5
noremap <C-c>6 6
noremap <C-c>7 7
noremap <C-c>8 8
noremap <C-c>9 9


"easier to type a>, i], etc... "
" <angle>
onoremap aa a>
xnoremap aa a>
onoremap ia i>
xnoremap ia i>
" [rectangle]
onoremap ar a]
xnoremap ar a]
onoremap ir i]
xnoremap ir i]
" 'quote'
onoremap aq a'
xnoremap aq a'
onoremap iq i'
xnoremap iq i'
" double quote
onoremap ad a"
xnoremap ad a"
onoremap id i"
xnoremap id i"



"  ____       _           _              _           _
" / ___|  ___| | ___  ___| |_  __      _(_)_ __   __| | _____      _____
" \___ \ / _ \ |/ _ \/ __| __| \ \ /\ / / | '_ \ / _` |/ _ \ \ /\ / / __|
"  ___) |  __/ |  __/ (__| |_   \ V  V /| | | | | (_| | (_) \ V  V /\__ \
" |____/ \___|_|\___|\___|\__|   \_/\_/ |_|_| |_|\__,_|\___/ \_/\_/ |___/
"

noremap <leader>4 1<C-w>w
noremap <leader>5 2<C-w>w
noremap <leader>6 3<C-w>w
noremap <leader>7 4<C-w>w
noremap <leader>8 5<C-w>w
noremap <leader>9 6<C-w>w
