colo solarized

" Highlight VCS conflict markers
hi VCSConflict ctermfg=bg ctermbg=9
match VCSConflict '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

hi TrailingWhitespace cterm=bold ctermfg=15
match TrailingWhitespace '\s\+$'

hi ErrorMsg ctermfg=bg ctermbg=9
"
" awesome 80-character limiter
au filetype python execute "setlocal colorcolumn=" . join(range(81,335), ',')

hi ColorColumn ctermbg=0
hi CursorLineNr ctermfg=0 ctermbg=3 cterm=bold
hi LineNr cterm=italic,bold
hi MatchParen cterm=bold ctermbg=NONE ctermfg=5
hi Comment cterm=italic
hi PythonString cterm=bold,italic ctermfg=NONE ctermbg=NONE
hi NonText ctermbg=0 ctermbg=0
hi SpecialKey ctermbg=8 ctermfg=NONE
hi NonText ctermbg=bg
hi Folded ctermbg=bg cterm=NONE ctermbg=bg ctermfg=14
hi Visual ctermfg=12 ctermbg=bg
hi ModeMsg ctermbg=3 ctermfg=bg
hi Todo ctermfg=3
hi SpellBad cterm=bold,italic,undercurl

hi pythonImport ctermbg=NONE ctermfg=3 cterm=NONE
hi pythonFunction ctermbg=NONE ctermfg=2
hi pythonStatement   ctermbg=NONE ctermfg=4
hi pythonRepeat      ctermbg=NONE ctermfg=4
hi pythonConditional ctermbg=NONE ctermfg=4
hi pythonException   ctermbg=NONE ctermfg=4
hi pythonOperator    ctermbg=NONE ctermfg=4

hi uniteCandidateInputKeyword ctermfg=3
hi uniteCandidateSourceName ctermfg=4
hi uniteInputLine ctermfg=fg
hi uniteSource__Buffer ctermfg=4
hi uniteSource__Buffer_Info ctermfg=10
hi uniteSource__Buffer_Modified ctermfg=10
hi uniteSource__Buffer_Prefix ctermfg=10
hi uniteSource__Buffer_Time ctermfg=10
hi uniteSource__GrepFile ctermbg=bg ctermfg=4
hi uniteSource__GrepLineNR ctermbg=bg ctermfg=10 cterm=bold,italic
hi uniteSource__Tag_File ctermbg=NONE ctermfg=4

hi vimfilerClosedFile ctermfg=4
hi vimfilerNonMark ctermfg=11
hi vimfilerDirectory ctermfg=4
hi vimfilerColumn__TypeDirectory ctermfg=4
hi vimfilerColumn__TimeToday ctermfg=fg

hi StatusLineFile ctermbg=10 ctermfg=bg
hi StatusLineFileReversed ctermbg=bg ctermfg=10
hi Invisible ctermbg=bg ctermfg=bg
" bold is a hack, statuslineNC and statusline cant be the same hilight
" not sure, why StatusLineNC needs the oposite than StatusLine, but it works
hi StatusLineNC ctermbg=bg ctermfg=14 cterm=bold
hi StatusLine ctermbg=14 ctermfg=bg
hi VertSplit ctermfg=14 ctermbg=bg


function! Update()
  hi LineNr ctermfg=0 ctermbg=0
  hi SignColumn ctermbg=bg
  hi clear CursorLine
  hi CursorLine ctermbg=0
  hi SyntasticError ctermbg=0 cterm=underline
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
blocks1 = list(reversed(['█', '▉', '▊', '▋', '▌', '▍', '▎', '▏']))
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
x = int(vim.eval('percent'))
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

set statusline=%{StatusLinePadding(StatusLineStatus(),\ 6)}%#StatusLineFile#▌%{StatusLineStatus()}%#StatusLineFileReversed#▌%#StatusLine#%{ASCIIScrollbar()}
