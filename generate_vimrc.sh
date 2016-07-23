


cat << EndOfMessage
set nocompatible
syntax on
set t_Co=16
set number
set mouse=nvc
hi! LineNr ctermbg=0 ctermfg=10

let g:solarized_termcolors=16

EndOfMessage

curl https://raw.githubusercontent.com/tpope/vim-rsi/master/plugin/rsi.vim
echo

curl https://raw.githubusercontent.com/tpope/vim-eunuch/master/plugin/eunuch.vim
echo

curl https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim 
echo

curl https://raw.githubusercontent.com/tpope/vim-commentary/master/plugin/commentary.vim
echo

curl https://raw.githubusercontent.com/tpope/vim-sleuth/master/plugin/sleuth.vim
echo
