
--  ____  _             _           
-- |  _ \| |_   _  __ _(_)_ __  ___ 
-- | |_) | | | | |/ _` | | '_ \/ __|
-- |  __/| | |_| | (_| | | | | \__ \
-- |_|   |_|\__,_|\__, |_|_| |_|___/
--                |___/             
vim.call('plug#begin')
local Plug = vim.fn['plug#']
Plug 'maxmx03/solarized.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
vim.call('plug#end')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()
vim.keymap.set("n", ",e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.env.PATH = vim.env.PATH .. ':/opt/homebrew/bin'


-- __     ___                         _       _   
-- \ \   / (_)_ __ ___  ___  ___ _ __(_)_ __ | |_ 
--  \ \ / /| | '_ ` _ \/ __|/ __| '__| | '_ \| __|
--   \ V / | | | | | | \__ \ (__| |  | | |_) | |_ 
--    \_/  |_|_| |_| |_|___/\___|_|  |_| .__/ \__|
--                                     |_|        
vim.cmd([[
autocmd InsertLeave,TextChanged * silent! write
" autocmd BufWritePre *.py %!ruff format -
set signcolumn=no
set background=light
colorscheme solarized
set shell=/bin/bash
set number
tnoremap <silent> <Esc><Esc> <C-\><C-n>
inoremap <silent> <Space><Space> <Esc>
nnoremap <silent> <Esc> <C-w><C-w>
nnoremap <silent> <Space> :Float<CR>
xnoremap <silent> <Space> :lua Float("visual")<CR>
nnoremap ; :
nnoremap <C-h> <C-\><C-n><C-w>h
nnoremap <C-j> <C-\><C-n><C-w>j
nnoremap <C-k> <C-\><C-n><C-w>k
nnoremap <C-l> <C-\><C-n><C-w>l
set statusline=\ \ \ \ \ \ \ \ \ ╰\ %f\ ╯

]])

--  ____            _             
-- |  _ \  ___  ___(_) __ _ _ __  
-- | | | |/ _ \/ __| |/ _` | '_ \ 
-- | |_| |  __/\__ \ | (_| | | | |
-- |____/ \___||___/_|\__, |_| |_|
--                    |___/       


vim.cmd([[
hi! link WinSeparator TermCursor
hi! link StatusLine TermCursor
hi! link StatusLineNC TermCursor
"hi link pythonString Normal
"hi link pythonString Normal
"hi link pythonStatement Function
"hi link pythonFunction Normal
"hi link pythonConditional Function
"hi link pythonRepeat   Normal
"hi link pythonOperator Normal
"hi link pythonException Function
"hi link pythonInclude  Function
"hi link pythonAsync    Function
"hi link pythonDecorator Normal
"hi link pythonDecoratorName Normal
"hi link pythonDoctestValue Normal
"hi link pythonMatrixMultiply Normal
"hi link pythonTodo     Normal
"hi link pythonComment  Normal
"hi link pythonQuotes   Normal
"hi link pythonEscape   Normal
"hi link pythonTripleQuotes Normal
"hi link pythonSpaceError Normal
"hi link pythonDoctest  Normal
"hi link pythonRawString Normal
"hi link pythonNumber   Normal
"hi link pythonBuiltin  Normal
"hi link pythonAttribute Normal
"hi link pythonExceptions Normal
"hi link pythonSync     Normal
]])

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = false,
  update_in_insert = true,
  severity_sort = true,
})

-- vim.diagnostic.config({
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = '✘',
--       [vim.diagnostic.severity.WARN] = '▲',
--       [vim.diagnostic.severity.HINT] = '⚑',
--       [vim.diagnostic.severity.INFO] = '»',
--     },
--   },
-- })



--  _     ____  ____  
-- | |   / ___||  _ \ 
-- | |   \___ \| |_) |
-- | |___ ___) |  __/ 
-- |_____|____/|_|    
vim.lsp.config['pyright'] = {
  cmd = { 'pyright' },
  filetypes = { 'python' },
  root_markers = { '.git' },
}
vim.lsp.enable('pyright')

vim.lsp.config['ruff'] = {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { '.git' },
}
vim.lsp.enable('ruff')


--  _____ _             _   
-- |  ___| | ___   __ _| |_ 
-- | |_  | |/ _ \ / _` | __|
-- |  _| | | (_) | (_| | |_ 
-- |_|   |_|\___/ \__,_|\__|
function Float(mode)
  local buf = vim.api.nvim_create_buf(false, true)

  local ui = vim.api.nvim_list_uis()[1]
  local width = ui.width - 20
  local height = ui.height - 5
  local col = math.floor((ui.width - width) / 2)
  local row = math.floor((ui.height - height) / 2)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "single",
  }

  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")

  if mode == "visual" then
    local end_line = vim.fn.getpos("'>")[2]
    line = line .. "," .. end_line
  end


  local cword = vim.fn.expand("<cword>")
  local cmd = "python3 ~/verbs/verbs.py " .. vim.fn.shellescape(file) .. " " .. vim.fn.shellescape(line) .. " " .. vim.fn.shellescape(cword)


  vim.g.floatbuf = buf
  vim.api.nvim_open_win(buf, true, opts)

  -- Start terminal with command
  vim.fn.termopen(cmd)
  vim.cmd("startinsert")
end

function FloatClose()
  if vim.g.floatbuf then
    pcall(vim.cmd, "bdelete! " .. vim.g.floatbuf)
    vim.g.floatbuf = nil
  end
end


vim.api.nvim_create_user_command("Float", Float, {})
vim.api.nvim_create_user_command("FloatClose", FloatClose, {})
