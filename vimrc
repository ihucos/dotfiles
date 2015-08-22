" ~/.vimrcfiles/plugins.vim  plugins
" ~/.vimrcfiles/misc.vim     misc
" ~/.vimrcfiles/sets.vim     sets
" ~/.vimrcfiles/mappings.vim mappings
" ~/.vimrcfiles/gui.vim      gui

set nocompatible
filetype off " required by vundle

" set the runtime path to include Vundle and initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
source ~/.vimrcfiles/plugins.vim
call vundle#end()

filetype plugin indent on

source ~/.vimrcfiles/misc.vim
source ~/.vimrcfiles/sets.vim
source ~/.vimrcfiles/mappings.vim
source ~/.vimrcfiles/gui.vim

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif


" provisorisch, test new workflow
set laststatus=0
