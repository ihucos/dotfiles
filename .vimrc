set nocompatible
set ignorecase
set number
set tags=.git/tags; " see http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html


filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


syntax on
colo solarized

iabbrev import pdb; pdb.set_trace()


au FileType python setlocal formatprg=autopep8\ -a\ -
au FileType gitcommit set spell
au FileType gitcommit hi clear SpellBad
au FileType gitcommit hi SpellBad cterm=underline

" can be made much faster with python ("autopep8.fix_code")
function! Pep8Fix(start_line, end_line)
  call ReadCmdInp("autopep8 --max-line-length=94 -aa -p 500 --range " .a:start_line." ".a:end_line. " -")

endfunction
function! Pep8FixLine()
  call Pep7Fix(line('.'), line('.'))
endfunction
function! Pep8FixVisual()
  call Pep8Fix(line("'<"), line("'>"))
endfunction

vnoremap <leader>a :<C-u>call Pep8FixVisual()<cr>
nnoremap <leader>a :<C-u>call Pep8FixLine()<cr>



" Highlight VCS conflict markers
hi VCSConflict ctermfg=8 ctermbg=9
match VCSConflict '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " seems to get overwritte by PythonExtraOperator

hi TrailingWhitespace ctermfg=15
match TrailingWhitespace '\s\+$'

hi ErrorMsg ctermfg=8 ctermbg=9

au FileType python execute "setlocal colorcolumn=" . join(range(81,335), ',')
au FileType python setlocal completeopt-=preview
au FileType undotree setlocal statusline=
au FileType diff setlocal statusline=

" solarized colors
" syntax match Red "Red" containedin=vimHiGroup,vimHiKeyList
hi Base02  ctermfg=0
hi Red     ctermfg=1
hi Green   ctermfg=2
hi Yellow  ctermfg=3
hi Blue    ctermfg=4
hi Magenta ctermfg=5
hi Cyan    ctermfg=6
hi Base2   ctermfg=7
hi Orange  ctermfg=9
hi Base01  ctermfg=10
hi Base00  ctermfg=11
hi Violet  ctermfg=13
hi Base1   ctermfg=14
hi Base3   ctermfg=15

hi Small ctermfg=NONE ctermbg=NONE
hi SmallGrey ctermbg=8 ctermfg=10 
hi Grey ctermbg=8 ctermfg=10 cterm=NONE
hi SmallBlue ctermfg=4 ctermbg=NONE 
hi link White Base3

hi ColorColumn ctermbg=0
hi CursorLineNr ctermfg=0 ctermbg=3 
hi MatchParen ctermbg=8 ctermfg=5
" hi Comment cterm=italic
hi NonText ctermbg=0 ctermbg=0
hi SpecialKey ctermbg=NONE ctermfg=10
hi NonText ctermbg=8
hi Folded ctermbg=8 cterm=NONE ctermbg=8 ctermfg=14
hi Visual ctermfg=12 ctermbg=NONE
hi ModeMsg ctermbg=3 ctermfg=8
hi Todo ctermfg=3
hi SpellBad cterm=undercurl

" hi PythonImport ctermbg=NONE ctermfg=3 cterm=NONE
" hi link pythonClassParameters pythonClass

hi link String Small
" hi link Type Blue

hi link PythonFloat Violet
hi link PythonNumber Violet
hi link PythonBuiltinObj Violet
hi link pythonOctNumber Violet
hi link pythonBinNumber Violet

hi link PythonExtraOperator Base00
hi link pythonDot Base00

hi link PythonClass Green
hi link PythonException Blue
hi link PythonFunction Yellow
hi link PythonInclude Magenta
hi link PythonRepeat Blue
hi link PythonSelf Base00
hi link PythonStatement Blue
hi link PythonString Small
hi link pythonBuiltinFunc Normal
hi link pythonBuiltinType Blue
hi link pythonConditional Blue
hi link pythonEscape PythonString
hi link pythonExClass Orange
hi link pythonExtraPseudoOperator Blue
hi link pythonOperator Blue
hi link pythonStrFormat Normal
hi link pythonStrFormatting Normal
hi link pythonStrTemplate PythonString
hi link pythonDocTest2 PythonString
hi link pythonDocstring PythonString
hi pythonTodo ctermfg=15 ctermbg=8
hi link pythonRun Grey
hi link PythonDecorator Magenta
hi link PythonDottedName Magenta

hi htmlLink ctermfg=4 cterm=italic
hi link htmlSpecialChar Base2
" hi htmlArg ctermfg=14 cterm=italic,bold
hi link htmlH1 White
hi link htmlH2 White
hi link htmlH3 White
hi link htmlH4 White
hi link htmlH5 White
hi link htmlH6 White
hi htmlTagName ctermfg=6
hi htmlSpecialTagName ctermfg=9
hi htmlTagN ctermfg=6
hi htmlTag ctermfg=6 
hi htmlEndTag ctermfg=6 
hi htmlComment  ctermfg=10
hi htmlCommentPart  ctermfg=10

hi jsGlobalObjects ctermfg=7
hi jsFunction ctermfg=4
hi jsStorageClass ctermfg=4
