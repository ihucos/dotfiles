
" boilerplate (do not edit) {{{
 set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" }}}

" plugins {{{
" Plugin 'Lokaltog/powerline'
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

" }}}

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif













" highlight WhitespaceEOL ctermbg=14
" match WhitespaceEOL /\s\+$/


