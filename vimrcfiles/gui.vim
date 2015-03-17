colo solarized

" Highlight VCS conflict markers
hi VCSConflict ctermfg=bg ctermbg=9
match VCSConflict '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " seems to get overwritte by PythonExtraOperator

hi TrailingWhitespace cterm=bold ctermfg=15
match TrailingWhitespace '\s\+$'

hi ErrorMsg ctermfg=bg ctermbg=9

" awesome 80-character limiter
au FileType python execute "setlocal colorcolumn=" . join(range(80,335), ',')
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

hi Small cterm=bold,italic ctermfg=NONE ctermbg=NONE
hi SmallGrey ctermbg=bg ctermfg=10 cterm=bold,italic
hi Grey ctermbg=bg ctermfg=10 cterm=NONE
hi SmallBlue ctermfg=4 ctermbg=NONE cterm=bold,italic
hi link White Base3

hi ColorColumn ctermbg=0
hi CursorLineNr ctermfg=0 ctermbg=3 cterm=bold
hi LineNr cterm=italic,bold
hi MatchParen ctermbg=3 ctermfg=bg
hi Comment cterm=italic
hi NonText ctermbg=0 ctermbg=0
hi SpecialKey ctermbg=8 ctermfg=NONE
hi NonText ctermbg=bg
hi Folded ctermbg=bg cterm=NONE ctermbg=bg ctermfg=14
hi Visual ctermfg=12 ctermbg=bg
hi ModeMsg ctermbg=3 ctermfg=bg
hi Todo ctermfg=3
hi SpellBad cterm=bold,italic,undercurl

" hi PythonImport ctermbg=NONE ctermfg=3 cterm=NONE
" hi link pythonClassParameters pythonClass

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
hi pythonTodo ctermfg=15 ctermbg=bg
hi link pythonRun Grey

hi link uniteSource__GrepLineNR SmallGrey
" hi link uniteSource__Outline Invisible
hi link uniteSource__Outline_function PythonFunction
hi link uniteSource__Outline_type PythonClass
hi uniteCandidateInputKeyword ctermbg=bg ctermfg=3
hi uniteCandidateSourceName ctermfg=4
hi uniteInputLine ctermfg=fg
hi uniteSource__Buffer ctermfg=4
hi uniteSource__Buffer_Info ctermfg=10
hi uniteSource__Buffer_Modified ctermfg=10
hi uniteSource__Buffer_Prefix ctermfg=10
hi uniteSource__Buffer_Time ctermfg=10
hi uniteSource__GrepFile ctermbg=bg ctermfg=4
hi uniteSource__Tag_File ctermbg=NONE ctermfg=4

hi vimfilerClosedFile ctermfg=4
hi vimfilerNonMark ctermfg=11
hi vimfilerDirectory ctermfg=4
hi vimfilerColumn__TypeDirectory ctermfg=4
hi vimfilerColumn__TimeToday ctermfg=fg

hi link UndotreeTimeStamp Normal
hi link UndotreeSavedSmall Blue
hi link UndotreeSavedBig Yellow
hi link UndotreeNext Normal
hi link UndotreeCurrent Normal
hi link UndotreeHEad Normal
hi link UndotreeNodeCurrent Yellow
hi link UndotreeCurrent Yellow

hi link diffRemoved Orange

hi StatusLineFile ctermbg=10 ctermfg=bg
hi StatusLineFileReversed ctermbg=bg ctermfg=10
hi Invisible ctermbg=bg ctermfg=bg
hi StatusLineASCIIScrollbar ctermfg=10
" bold is a hack, statuslineNC and statusline cant be the same hilight
" not sure, why StatusLineNC needs the oposite than StatusLine, but it works
hi StatusLineNC ctermbg=bg ctermfg=14 cterm=bold
hi StatusLine ctermbg=14 ctermfg=bg
hi VertSplit ctermfg=14 ctermbg=bg

hi link helpCommand Blue
hi link qfLineNr SmallGrey
hi link qfSeparator Invisible

function! Update()
  hi SignColumn ctermbg=bg
  hi clear CursorLine
  hi CursorLine ctermbg=0
  hi SyntasticError ctermbg=0 cterm=underline
  hi SyntasticErrorSign ctermfg=1 ctermbg=bg
  hi SyntasticWarningSign ctermfg=9 ctermbg=bg
  hi SyntasticStyleErrorSign ctermfg=12 ctermbg=bg
  hi SyntasticStyleWarningSign ctermfg=12 ctermbg=bg

endfunction

call Update()
au Syntax * Update
au VimEnter * Update

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

set statusline=%{StatusLinePadding(StatusLineStatus(),\ 6)}%#StatusLineFile#▌%{StatusLineStatus()}%#StatusLineFileReversed#▌%#StatusLineASCIIScrollbar#%{ASCIIScrollbar()}%#StatusLine#














" remove the keywords. we'll re-add them below
" syntax clear pythonOperator
" syntax clear pythonStatement



" " include the space after “not” – if present – so that “not a” becomes “¬a”.
" " also, don't hide “not” behind ‘¬’ if it is after “is ”.
" syntax match pyNiceOperator "<=" conceal cchar=≤
" syntax match pyNiceOperator ">=" conceal cchar=≥
" syntax match pyNiceOperator "=\@<!===\@!" conceal cchar=≡
" syntax match pyNiceOperator "!=" conceal cchar=≢
" syntax keyword pyNiceStatement def nextgroup=pythonFunction skipwhite


" syn keyword MyPythonSelf self cls conceal cchar=. nextgroup=pythonDot

" hi link pyNiceOperator Operator
" hi link pyNiceStatement Statement
" hi link pyNiceKeyword Keyword
" hi link pyNiceBuiltin Builtin
" hi! link Conceal pythonDot
" setlocal conceallevel=1
" "
" hi link MyPythonSelf Normal
