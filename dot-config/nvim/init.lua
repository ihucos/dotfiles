
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

Plug "nvim-lua/plenary.nvim" -- dependency for codeium
Plug "Exafunction/codeium.nvim"

vim.call('plug#end')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup(
	{
		sync_root_with_cwd = true,
		view = {
                        float = {
				enable = true,
				open_win_config = function()
					return {
					  relative = "editor",
					  border = "rounded",
					  width = 1, -- adaptive size handles it
					  height = vim.o.lines - 3,
					  row = 0,
					  col = 0,
					}
				      end,
			},
			adaptive_size = true,
		},
	}
)

vim.keymap.set("n", ",e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.env.PATH = vim.env.PATH .. ':/opt/homebrew/bin'



require("codeium").setup({
  -- Optionally disable cmp source if using virtual text only
  enable_cmp_source = false,
  virtual_text = {
      enabled = true,

      -- These are the defaults

      -- Set to true if you never want completions to be shown automatically.
      manual = false,
      -- A mapping of filetype to true or false, to enable virtual text.
      filetypes = {},
      -- Whether to enable virtual text of not for filetypes not specifically listed above.
      default_filetype_enabled = true,
      -- How long to wait (in ms) before requesting completions after typing stops.
      idle_delay = 75,
      -- Priority of the virtual text. This usually ensures that the completions appear on top of
      -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
      -- desired.
      virtual_text_priority = 65535,
      -- Set to false to disable all key bindings for managing completions.
      map_keys = true,
      -- The key to press when hitting the accept keybinding but no completion is showing.
      -- Defaults to \t normally or <c-n> when a popup is showing. 
      accept_fallback = nil,
      -- Key bindings for managing completions in virtual text mode.
      key_bindings = {
	  -- Accept the current completion.
	  accept = "<Tab>",
	  -- Accept the next word.
	  accept_word = false,
	  -- Accept the next line.
	  accept_line = false,
	  -- Clear the virtual text.
	  clear = false,
	  -- Cycle to the next completion.
	  next = "<M-]>",
	  -- Cycle to the previous completion.
	  prev = "<M-[>",
      }
  }
})


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
set statusline=\ \ %f\ \ ▄
:set fillchars+=stl:▄,stlnc:▄,vert:\ 

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
au TermOpen * setlocal nonumber
au TermOpen * setlocal statusline=▄
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

vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.py',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})


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
