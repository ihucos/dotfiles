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
hi uniteSource__Buffer ctermfg=4
hi uniteSource__Buffer_Info ctermfg=10
hi uniteSource__Buffer_Modified ctermfg=10
hi uniteSource__Buffer_Prefix ctermfg=10
hi uniteSource__Buffer_Time ctermfg=10
hi uniteSource__Tag_File ctermbg=NONE ctermfg=4

hi StatusLineFile ctermbg=fg ctermfg=bg
" italic is a hack, statuslineNC and statusline cant be the same hilight
hi StatusLineNC ctermbg=14 ctermfg=bg cterm=italic
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
