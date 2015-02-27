let mapleader = "\<Space>"

" === EXPERIMENTAL STUFF HERE ===

noremap <C-c> 5jzz
noremap <C-x> 5kzz

" ===============================

" nice extra stuff
noremap <CR> mzo<ESC>`z
noremap <BS> mzO<ESC>`z
nnoremap Y y$

" Restore case-sensitivity for jumping to tags (set ic disables it)
map <silent> <C-]> :set noic<cr>g<C-]><silent>:set ic<cr>

" macro and repeat command also in visual mode
vnoremap <leader>. :normal .<cr>
vnoremap <leader>@ :normal @

nnoremap <silent> p p`]
nnoremap j gj
nnoremap k gk
noremap gj j
noremap gk k
noremap J 5j
noremap K 5k


" FIXME: pasting before first charachter of line does not work
nnoremap p gP`[v`]=
nnoremap P gp`[v`]=
vnoremap p gP`[v`]=
vnoremap P gp`[v`]=

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
map <up> 2<C-w>+
map <down> 2<C-w>-
map <left> 2<C-w><
map <right> 2<C-w>>
imap <up> <ESC>2<C-w>+a
imap <down> <ESC>2<C-w>-a
imap <left> <ESC>2<C-w><a
imap <right> 2<C-w>>a

"     _                _
"    | | ___  __ _  __| | ___ _ __   _ __ ___   __ _ _ __  ___
"    | |/ _ \/ _` |/ _` |/ _ \ '__| | '_ ` _ \ / _` | '_ \/ __|
"    | |  __/ (_| | (_| |  __/ |    | | | | | | (_| | |_) \__ \
"    | |\___|\__,_|\__,_|\___|_|    |_| |_| |_|\__,_| .__/|___/
"    |_|


" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" map remapped standart mapping with leader
nnoremap <leader>m m
nnoremap <leader>J J
nnoremap <leader>K K

map <leader>c cc<ESC>

map <leader>w :w<cr>
vmap <leader>w :w<cr>
map <leader>q :qa<cr>
vmap <leader>q <ESC>:qa<cr>

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
    call MyUnite('buffer:- tag file_rec/async', 'multipurpose', '-start-insert -short-source-names')
endfunction
noremap <leader>u :call MultiPurposeUnite()<cr>
noremap <leader>/ :call MyUnite('line', 'line', '-start-insert')<cr>
noremap <leader>g :call MyUnite('grep:.', 'grep', '')<cr>

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

map <leader>f :VimFilerCreate<cr>T
autocmd FileType vimfiler map <buffer> <ESC> :bd<CR>

nnoremap <Leader>t :Tagbar<cr>

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

inoremap <silent> <C-h> <ESC>l:TmuxNavigateLeft<cr>
inoremap <silent> <C-j> <ESC>l:TmuxNavigateDown<cr>
inoremap <silent> <C-k> <ESC>l:TmuxNavigateUp<cr>
inoremap <silent> <C-l> <ESC>l:TmuxNavigateRight<cr>

vnoremap <silent> <C-h> <ESC>:TmuxNavigateLeft<cr>gv
vnoremap <silent> <C-j> <ESC>:TmuxNavigateDown<cr>gv
vnoremap <silent> <C-k> <ESC>:TmuxNavigateUp<cr>gv
vnoremap <silent> <C-l> <ESC>:TmuxNavigateRight<cr>gv

" see why we need <C-c>: http://superuser.com/questions/739971/how-to-properly-remap-del-to-esc-in-vim)
cnoremap <silent> <C-h> <C-c>:TmuxNavigateLeft<cr>
cnoremap <silent> <C-j> <C-c>:TmuxNavigateDown<cr>
cnoremap <silent> <C-k> <C-c>:TmuxNavigateUp<cr>
cnoremap <silent> <C-l> <C-c>:TmuxNavigateRight<cr>

" unmap mapping from vim-rooter
au VimEnter * unmap <leader>cd

function! UniteTmuxNavigteOverwrite()
  inoremap <silent> <C-h> <ESC>:execute "normal \<plug>(unite_exit)"<cr>:TmuxNavigateLeft<cr>
  inoremap <silent> <C-j> <ESC>:execute "normal \<plug>(unite_exit)"<cr>:TmuxNavigateDown<cr>
  inoremap <silent> <C-k> <ESC>:execute "normal \<plug>(unite_exit)"<cr>:TmuxNavigateUp<cr>
  inoremap <silent> <C-l> <ESC>:execute "normal \<plug>(unite_exit)"<cr>:TmuxNavigateRight<cr>
endfunction

" exit this sort of buffers with ESC
autocmd FileType unite call UniteTmuxNavigteOverwrite()
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

noremap <leader>0 0
noremap <leader>1 1
noremap <leader>2 2
noremap <leader>3 3
noremap <leader>4 4
noremap <leader>5 5
noremap <leader>6 6
noremap <leader>7 7
noremap <leader>8 8
noremap <leader>9 9


