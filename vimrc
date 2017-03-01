set nocompatible
syntax on
set t_Co=16
set number
set tags=.git/tags; " see http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
set clipboard=unnamed
set background=dark


hi! LineNr ctermbg=0 ctermfg=10


call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'hdima/python-syntax'
Plug 'mbbill/undotree'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'python-rope/ropevim'
Plug 'ervandew/supertab'
call plug#end()

colo solarized

autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake

autocmd FileType python setlocal omnifunc=RopeCompleteFunc
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let ropevim_guess_project=1

function! Figlet(text)
  execute ":read !figlet " . a:text
  normal `[v`]
  normal gc
  normal `[v`]
  silent! execute ":'<,'>s/\\s\\+$//g"
  execute "normal \<esc>"
endfunction
command! -nargs=1 Figlet call Figlet(<f-args>)

" TODO: move this to bashrc

command! -nargs=0 Diff :w !diff % -

au FileType python setlocal formatprg=autopep8\ -a\ -
au FileType gitcommit set spell
au FileType gitcommit hi clear SpellBad
au FileType gitcommit hi SpellBad cterm=underline

function! ReadCmdInp(cmd)
  let mycol = col('.')
  let line = line('$') - line('.')
  execute ':%!' . a:cmd
  call cursor(line('$')-line, mycol)
endfunction

" can be made much faster with python ("autopep8.fix_code")
function! Pep8Fix(start_line, end_line)
  call ReadCmdInp("autopep8 --max-line-length=94 -aa -p 500 --range " .a:start_line." ".a:end_line. " -")
endfunction
function! Pep8FixLine()
  call Pep8Fix(line('.'), line('.'))
endfunction
function! Pep8FixVisual()
  call Pep8Fix(line("'<"), line("'>"))
endfunction

vnoremap <space>p :<C-u>call Pep8FixVisual()<cr>
nnoremap <space>p :<C-u>call Pep8FixLine()<cr>


function! PyImport(module)
  call ReadCmdInp('isort -a "'.a:module.'" -')
endfunction
command! -nargs=1 PyImport silent call PyImport(<f-args>)
" function! PyAutoflake()
"   call ReadCmdInp("autoflake --remove-all-unused-imports " .expand('%:p'))
" endfunction
" command! -nargs=0 PyAutoflake silent call PyAutoflake(<f-args>)






" Highlight VCS conflict markers
hi VCSConflict ctermfg=8 ctermbg=9
match VCSConflict '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " seems to get overwritte by PythonExtraOperator

hi TrailingWhitespace cterm=bold ctermfg=15
match TrailingWhitespace '\s\+$'

hi ErrorMsg ctermfg=8 ctermbg=9

au FileType python execute "setlocal colorcolumn=" . join(range(81,335), ',')
au FileType python setlocal completeopt-=preview
au FileType undotree setlocal statusline=
au FileType diff setlocal statusline=

" solarized colors
" syntax match Red "Red" containedin=vimHiGroup,vimHiKeyList
hi Base02  ctermfg=0 ctermbg=NONE cterm=NONE
hi Red     ctermfg=1 ctermbg=NONE cterm=NONE
hi Green   ctermfg=2 ctermbg=NONE cterm=NONE
hi Yellow  ctermfg=3 ctermbg=NONE cterm=NONE
hi Blue    ctermfg=4 ctermbg=NONE cterm=NONE
hi Magenta ctermfg=5 ctermbg=NONE cterm=NONE
hi Cyan    ctermfg=6 ctermbg=NONE cterm=NONE
hi Base2   ctermfg=7 ctermbg=NONE cterm=NONE
hi Orange  ctermfg=9 ctermbg=NONE cterm=NONE
hi Base01  ctermfg=10 ctermbg=NONE cterm=NONE
hi Base00  ctermfg=11 ctermbg=NONE cterm=NONE
hi Violet  ctermfg=13 ctermbg=NONE cterm=NONE
hi Base1   ctermfg=14 ctermbg=NONE cterm=NONE
hi Base3   ctermfg=15 ctermbg=NONE cterm=NONE

hi Small cterm=bold ctermfg=NONE ctermbg=NONE
hi SmallGrey ctermbg=8 ctermfg=10 cterm=bold
hi Grey ctermbg=8 ctermfg=10 cterm=NONE
hi SmallBlue ctermfg=4 ctermbg=NONE cterm=bold
hi link White Base3

hi ColorColumn ctermbg=0
hi CursorLineNr ctermfg=0 ctermbg=3 cterm=bold
hi LineNr cterm=bold
hi MatchParen ctermbg=8 ctermfg=5
hi NonText ctermbg=0 ctermbg=0
hi SpecialKey ctermbg=NONE ctermfg=10
hi NonText ctermbg=8
hi Folded ctermbg=8 cterm=NONE ctermbg=8 ctermfg=14
hi Visual ctermfg=12 ctermbg=NONE
hi ModeMsg ctermbg=3 ctermfg=8
hi Todo ctermfg=3
hi SpellBad cterm=bold,undercurl

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

hi htmlLink ctermfg=4
hi link htmlSpecialChar Base2
" hi htmlArg ctermfg=14 cterm=bold
hi link htmlH1 White
hi link htmlH2 White
hi link htmlH3 White
hi link htmlH4 White
hi link htmlH5 White
hi link htmlH6 White
hi htmlTagName ctermfg=6
hi htmlSpecialTagName ctermfg=9
hi htmlTagN ctermfg=6
hi htmlTag ctermfg=6 cterm=bold
hi htmlEndTag ctermfg=6 cterm=bold
hi htmlComment  ctermfg=10
hi htmlCommentPart  ctermfg=10

hi jsGlobalObjects ctermfg=7
hi jsFunction ctermfg=4
hi jsStorageClass ctermfg=4

hi djangoTagBlock ctermfg=2 cterm=bold
hi djangoStatement ctermfg=2 cterm=bold
hi djangoArgument ctermfg=2 cterm=bold
hi djangoFilter ctermfg=2 cterm=bold
hi djangoVarBlock ctermfg=2

hi link UndotreeTimeStamp Normal
hi link UndotreeSavedSmall Blue
hi link UndotreeSavedBig Yellow
hi link UndotreeNext Normal
hi link UndotreeCurrent Normal
hi link UndotreeHEad Normal
hi link UndotreeNodeCurrent Yellow
hi link UndotreeCurrent Yellow

hi link diffRemoved Orange

hi StatusLineFile ctermbg=10 ctermfg=8
hi StatusLineFileReversed ctermbg=8 ctermfg=10
hi Invisible ctermbg=8 ctermfg=8
hi StatusLineASCIIScrollbar ctermfg=10
" bold is a hack, statuslineNC and statusline cant be the same hilight
" not sure, why StatusLineNC needs the oposite than StatusLine, but it works
hi StatusLineNC ctermbg=8 ctermfg=14 cterm=bold
hi StatusLine ctermbg=14 ctermfg=8
hi VertSplit ctermfg=14 ctermbg=8

hi link helpCommand Blue
hi link qfLineNr SmallGrey
hi link qfSeparator Invisible

" function! Update()
hi SignColumn ctermbg=8
hi clear CursorLine
hi CursorLine ctermbg=0
hi SyntasticError ctermbg=0 cterm=underline
hi SyntasticErrorSign ctermfg=1 ctermbg=8
hi SyntasticWarningSign ctermfg=9 ctermbg=8
hi SyntasticStyleErrorSign ctermfg=12 ctermbg=8
hi SyntasticStyleWarningSign ctermfg=12 ctermbg=8
" endfunction


" hi clear CursorLine
" augroup CLClear
"     autocmd! ColorScheme * hi clear CursorLine
" augroup END

" hi CursorLineNR ctermfg=5
" augroup CLNRSet
"     autocmd! ColorScheme * hi CursorLineNR ctermfg=5
" augroup END


" call Update()
" au Syntax * Update
" au VimEnter * Update " makes vim always jump to top when opened. do i need this?

" make sign column always visible
function! PlaceDummySign()
  if &buftype != "nofile"
    sign define dummy
    execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
endif
endfunction
au BufEnter * call PlaceDummySign()

au WinEnter * set cursorline
au WinLeave * set nocursorline

hi link diffSubname Blue



" ######################
" ### the statusline ###
" ######################

function! ASCIIScrollbar()
let percent = line('.')*100/line('$')
python << EOF
blocks1 = list(reversed(['█', '▉', '▊', '▋', '▌', '▍', '▎', '▏', '─']))
# blocks2 = list(reversed(['█', '▇', '▆', '▅', '▄', '▃', '▂', '▁']))
blocks3 = []
for b in blocks1:
  blocks3.append(b + '───')
for b in blocks1:
  blocks3.append('█' + b + '──')
for b in blocks1:
  blocks3.append('██' + b + '─')
for b in blocks1:
  blocks3.append('███' + b + '')
x = 100 - int(vim.eval('percent'))
x = int(round( (x/100.)*(len(blocks3)-1) ))
vim.command('let retval = "' + blocks3[x] + '"')
EOF
return retval
endfunction

function! StatusLinePadding(status, magic_adjust)
  let status = StatusLineStatus()
  return repeat("─", winwidth(0)-(strlen(status) + a:magic_adjust))
endfunction

function! StatusLineStatus()
  let stat = expand('%:t') . ':' . line(".")
  return stat
endfunction



set grepprg=ag\ --nogroup\ --nocolor\ --python

" for Resmio
au FileType * setlocal makeprg=pre-commit\ run\ flake8\ --all-files
" set makeprg=pre-commit\ run\ --all-files
set errorformat=%E%f:%l:\ could\ not\ compile,%-Z%p^,%E%f:%l:%c:\ %m,%E%f:%l:\ %m,%-G%.%#
