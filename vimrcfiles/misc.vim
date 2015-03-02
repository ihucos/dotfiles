

" TODO: py print jedi_vim.get_script().definition()[0].description
" TODO: jump to next ctags definition



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

function! <SID>SynStack()
  if !exists("*synstack")
    echo 'Syntax hilighting seems not to be supported, check source code of this message'
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! -nargs=0 Syntax call <SID>SynStack()

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

" TODO: move this to bashrc
" autocmd VimEnter * if argc() == 0 | call MultiPurposeUnite() | endif

function! MyUnite(source, buffer_name, extra)
  execute 'Unite ' . a:source . ' -buffer-name=' . a:buffer_name . ' -no-split -winheight=' . winheight(0) . ' ' . a:extra
endfunction
command! -nargs=1 MyUnite call MyUnite(<f-args>, 'buffernamehere', '')
function! MultiPurposeUnite()
  call MyUnite('buffer:- tag file_rec/git', 'multipurpose', '-start-insert -short-source-names')
endfunction

command! -nargs=0 Diff :w !grc diff % -

au FileType python setlocal formatprg=autopep8\ -a\ -

function! ReadCmdInp(cmd)
  let mycol = col('.')
  let line = line('$') - line('.')
  execute ':%!' . a:cmd
  call cursor(line('$')-line, mycol)
endfunction

" can be make much faster with python ("autopep8.fix_code")
function! Pep8Fix(start_line, end_line)
  call ReadCmdInp("autopep8 -aa -p 500 --range " .a:start_line." ".a:end_line. " -")
endfunction
function! Pep8FixLine()
  call Pep8Fix(line('.'), line('.'))
endfunction
function! Pep8FixVisual()
  call Pep8Fix(line("'<"), line("'>"))
endfunction

function! PyImportAdd(module)
  call ReadCmdInp('isort -a "'.a:module.'" -')
endfunction
command! -nargs=1 PyImportAdd silent call PyImportAdd(<f-args>)
function! PyImportRemove(module)
  call ReadCmdInp('isort -r "'.a:module.'" -')
endfunction
command! -nargs=1 PyImportRemove silent call PyImportRemove(<f-args>)
