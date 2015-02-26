" taken from http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompt
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" command! BrowserReload
"     :Silent python ~/projects/wintoggle.py hide<cr>

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

function! s:BigHelp(arg)
    exe ":tab h ".a:arg
endfunction
command! -nargs=1 -complete=help H call s:BigHelp(<f-args>)


" Use generic omnicompletion if something more specific isn't already set
if has("autocmd") && exists("+omnifunc")
  au Filetype *
        \ if &omnifunc == "" | setl omnifunc=syntaxcomplete#Complete | endif
endif
"
" Helps if you have to use another editor on the same file
au FileChangedShell * Warn "File has been changed outside of Vim."
command! -nargs=1 Warn echohl WarningMsg | echo <args> | echohl None

function! Flash()
  call vimproc#system('bash -lc "flash"')
endfunction
command! -nargs=0 Flash call Flash(<f-args>)

function! Homer(text)
  call vimproc#system_bg('bash -lc "homer \"' . a:text . '\""')
endfunction
command! -nargs=1 Homer call Homer(<f-args>)

" config to save files with +x when a shebang is found on line
" au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod u+x <afile>


function! Figlet(text)
  execute ":read !figlet " . a:text
  normal `[v`]
  normal gc
  normal `[v`]
  silent! execute ":'<,'>s/\\s\\+$//g"
  execute "normal \<esc>"
endfunction
command! -nargs=1 Figlet call Figlet(<f-args>)

