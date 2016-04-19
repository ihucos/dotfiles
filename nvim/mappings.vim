let mapleader = "\<Space>"
 " allow holding down the leader key like a modfier key
map <leader><leader> <leader>
let maplocalleader = "\\"

noremap J 5j
noremap K 5k
noremap ; :
nnoremap Y y$
nnoremap gV `[v`]
" Restore case-sensitivity for jumping to tags (set ic disables it)
map <silent> <C-]> :set noic<cr>g<C-]><silent>:set ic<cr>

nnoremap j gj
nnoremap k gk
noremap gj j
noremap gk k

function! NextParagraph()
  if getline(".") == ""
    normal! }{j
  else
    normal! }}{j
  endif
endfunction
function! PrevParagraph()
  normal! k{j
endfunction
nnoremap <leader>j :silent call NextParagraph()<cr>
nnoremap <leader>k :silent call PrevParagraph()<cr>
vnoremap <leader>j :<C-u>silent call NextParagraph()<cr>
vnoremap <leader>k :<C-u>silent call PrevParagraph()<cr>
onoremap <leader>j :silent call NextParagraph()<cr>
onoremap <leader>k :silent call PrevParagraph()<cr>
nnoremap m :silent call NextParagraph()<cr>
nnoremap , :silent call PrevParagraph()<cr>
vnoremap m :<C-u>silent call NextParagraph()<cr>
vnoremap , :<C-u>silent call PrevParagraph()<cr>
onoremap m :silent call NextParagraph()<cr>
onoremap , :silent call PrevParagraph()<cr>


" resize windows
noremap <up> 2<C-w>+
noremap <down> 2<C-w>-
noremap <left> 2<C-w><
noremap <right> 2<C-w>>
inoremap <up> <ESC>2<C-w>+a
inoremap <down> <ESC>2<C-w>-a
inoremap <left> <ESC>2<C-w><a
inoremap <right> 2<C-w>>a

" macro and repeat command also in visual mode
vnoremap <leader>. :normal .<cr>
vnoremap <leader>@ :normal @

nnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>h ^
vnoremap <leader>l $h
onoremap <leader>h ^
onoremap <leader>l $

vnoremap <leader>a :<C-u>call Pep8FixVisual()<cr>
nnoremap <leader>a :<C-u>call Pep8FixLine()<cr>
map <leader>r :source ~/.vimrc<cr>
nnoremap <leader>U :syntax sync fromstart<cr>:redraw!<cr>

nnoremap <leader>m m
nnoremap <leader>J J
nnoremap <leader>K K

map <leader>x cc<ESC>
map <leader>c <leader>mzgcip`z<ESC>

map <leader>w :w<cr>
vmap <leader>w :w<cr>
map <leader>q :qa<cr>
vmap <leader>q :<C-u>qa<cr>

inoremap <C-v> <ESC>"+pa
noremap <C-v> "+p
vnoremap <C-v> "+p
cnoremap <C-v> <C-r>+
vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-p> <C-r>"
noremap <leader>v <C-v>
vnoremap <leader>v <C-v>

nnoremap <leader>? :echo "`~ 1!    2@    3#    4$    5%     6^    7&    8*    9(    0)    -_    =+"<cr>
vnoremap <leader>? :echo "`~ 1!    2@    3#    4$    5%     6^    7&    8*    9(    0)    -_    =+"<cr>

" expand %% to path of the current file when writing an vim command
cnoremap %% <C-R>=expand('%:p:h') . '/'<cr>
cnoremap %. <C-R>=getcwd()<cr>

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

" noremap <leader>4 1<C-w>w
" noremap <leader>5 2<C-w>w
" noremap <leader>6 3<C-w>w
" noremap <leader>7 4<C-w>w
" noremap <leader>8 5<C-w>w
" noremap <leader>9 6<C-w>w
