
--  ____  _             _           
-- |  _ \| |_   _  __ _(_)_ __  ___ 
-- | |_) | | | | |/ _` | | '_ \/ __|
-- |  __/| | |_| | (_| | | | | \__ \
-- |_|   |_|\__,_|\__, |_|_| |_|___/
--                |___/             
vim.call('plug#begin')
local Plug = vim.fn['plug#']
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
set background=dark
set shell=/bin/bash
set number
set termguicolors
set mouse=a
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
set statusline=\ \ %f\ \ ▀
:set fillchars+=stl:▀,stlnc:▀,vert:\ 

]])



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



--  ____            _             
-- |  _ \  ___  ___(_) __ _ _ __  
-- | | | |/ _ \/ __| |/ _` | '_ \ 
-- | |_| |  __/\__ \ | (_| | | | |
-- |____/ \___||___/_|\__, |_| |_|
--                    |___/       



function hsl(h,s,l)
    h=h/360
    local r,g,b
    if s==0 then r,g,b=l,l,l
    else
        local q=l<0.5 and l*(1+s) or l+s-l*s
        local p=2*l-q
        local function f(t) t=t%1; return t<1/6 and p+(q-p)*6*t or t<1/2 and q or t<2/3 and p+(q-p)*(2/3-t)*6 or p end
        r,g,b=f(h+1/3),f(h),f(h-1/3)
    end
    return string.format("#%02X%02X%02X",r*255,g*255,b*255)
end

function recolor_init_vars()
  recolor_contrast_incr = 1
  recolor_colorshift = 0
  recolor_darken = 0
end
recolor_init_vars()

function recolor_shift()
  recolor_colorshift = recolor_colorshift + 5
  recolor()
end

function recolor_reset()
  recolor_init_vars()
  recolor()
end

function recolor_contrast(mod)
  recolor_contrast_incr = recolor_contrast_incr + mod
  recolor()
end

function recolor_darkness(mod)
  recolor_darken = recolor_darken + mod
  recolor()
end


function recolor()
  vim.cmd("hi clear")

  local co_offset_h = 0
  local co_offset_s = 0.0
  local co_offset_l = (vim.o.background == "dark" and 1 or -1) * recolor_contrast_incr / 10
  
  local bg_offset_h = recolor_colorshift
  local bg_offset_s = 0
  local bg_offset_l = -1 * recolor_darken / 70
  
  local ac_offset_h = 0
  local ac_offset_s = 0
  local ac_offset_l = 0
  
  -- Solarized color palette
  
  -- Background colors
  local Base03 = hsl(192 + bg_offset_h, 1.00 + bg_offset_s, 0.11 + bg_offset_l)
  local Base02 = hsl(192 + bg_offset_h, 0.81 + bg_offset_s, 0.14 + bg_offset_l)
  local Base2  = hsl(46  + bg_offset_h, 0.42 + bg_offset_s, 0.88 + bg_offset_l)
  local Base3  = hsl(44  + bg_offset_h, 0.87 + bg_offset_s, 0.94 + bg_offset_l)
  
  -- Content colors
  local Base01 = hsl(194 + co_offset_h, 0.14 + co_offset_s, 0.40 + co_offset_l)
  local Base00 = hsl(196 + co_offset_h, 0.13 + co_offset_s, 0.45 + co_offset_l)
  local Base0  = hsl(186 + co_offset_h, 0.08 + co_offset_s, 0.55 + co_offset_l)
  local Base1  = hsl(180 + co_offset_h, 0.07 + co_offset_s, 0.60 + co_offset_l)
  
  -- Accent colors
  local Yellow  = hsl(45  + ac_offset_h, 1.00 + ac_offset_s, 0.35 + ac_offset_l)
  local Orange  = hsl(18  + ac_offset_h, 0.80 + ac_offset_s, 0.44 + ac_offset_l)
  local Red     = hsl(1   + ac_offset_h, 0.71 + ac_offset_s, 0.52 + ac_offset_l)
  local Magenta = hsl(331 + ac_offset_h, 0.64 + ac_offset_s, 0.52 + ac_offset_l)
  local Violet  = hsl(237 + ac_offset_h, 0.43 + ac_offset_s, 0.60 + ac_offset_l)
  local Blue    = hsl(205 + ac_offset_h, 0.69 + ac_offset_s, 0.49 + ac_offset_l)
  local Cyan    = hsl(175 + ac_offset_h, 0.59 + ac_offset_s, 0.40 + ac_offset_l)
  local Green   = hsl(68  + ac_offset_h, 1.00 + ac_offset_s, 0.30 + ac_offset_l)
  
  -- ligth or dark theme
  local BG, FG
  if vim.o.background == "dark" then
      BG = Base03
      FG = Base00
  else
      BG = Base3
      FG = Base0
  end
  
  -- Base highlight groups
  vim.api.nvim_set_hl(0, "Gray",          { bg = BG, fg = Base1 })
  vim.api.nvim_set_hl(0, "Normal",        { bg = BG, fg = FG })
  vim.api.nvim_set_hl(0, "Red",           { bg = BG, fg = Red })
  vim.api.nvim_set_hl(0, "Green",         { bg = BG, fg = Green })
  vim.api.nvim_set_hl(0, "Blue",          { bg = BG, fg = Blue })
  vim.api.nvim_set_hl(0, "BlueInverted",  { bg = Blue, fg = BG })
  vim.api.nvim_set_hl(0, "Cyan",          { bg = BG, fg = Cyan })
  vim.api.nvim_set_hl(0, "Yellow",        { bg = BG, fg = Yellow })
  vim.api.nvim_set_hl(0, "Orange",        { bg = BG, fg = Orange })
  vim.api.nvim_set_hl(0, "Magenta",       { bg = BG, fg = Magenta })
  vim.api.nvim_set_hl(0, "Violet",        { bg = BG, fg = Violet })
  
  vim.api.nvim_set_hl(0, "Visual",        { bg = FG,     fg = BG })
  vim.api.nvim_set_hl(0, "Search",        { bg = Yellow, fg = BG })
  vim.api.nvim_set_hl(0, "ModeMsg",       { bg = FG,     fg = BG })
  
  -- UI elements
  vim.api.nvim_set_hl(0, "LineNr",        { link = "Blue" })
  vim.api.nvim_set_hl(0, "StatusLine",    { link = "BlueInverted" })
  vim.api.nvim_set_hl(0, "StatusLineNC",  { link = "BlueInverted" })
  vim.api.nvim_set_hl(0, "WinSeparator",  { link = "BlueInverted" })
  
  -- Code syntax
  vim.api.nvim_set_hl(0, "@variable",     { link = "Normal" })
  vim.api.nvim_set_hl(0, "Delimiter",     { link = "Normal" })
  vim.api.nvim_set_hl(0, "Title",         { link = "Normal" })
  vim.api.nvim_set_hl(0, "Comment",       { link = "Gray" })
  vim.api.nvim_set_hl(0, "Constant",      { link = "Normal" })
  vim.api.nvim_set_hl(0, "String",        { link = "Cyan" })
  vim.api.nvim_set_hl(0, "Number",        { link = "Normal" })
  vim.api.nvim_set_hl(0, "Identifier",    { link = "Blue" })
  vim.api.nvim_set_hl(0, "Function",      { link = "Normal" })
  vim.api.nvim_set_hl(0, "Statement",     { link = "Blue" })
  vim.api.nvim_set_hl(0, "Keyword",       { link = "Blue" })
  vim.api.nvim_set_hl(0, "PreProc",       { link = "Blue" })
  vim.api.nvim_set_hl(0, "Type",          { link = "Blue" })
  vim.api.nvim_set_hl(0, "Special",       { link = "Blue" })
  vim.api.nvim_set_hl(0, "Operator",      { link = "Blue" })
  vim.api.nvim_set_hl(0, "Error",         { link = "Red" })


  -- terminal colors
  vim.g.terminal_color_0 = BG
  vim.g.terminal_color_8 = BG
  vim.g.terminal_color_7 = FG
  vim.g.terminal_color_15 = FG
  vim.g.terminal_color_1 = Red
  vim.g.terminal_color_9 = Red
  vim.g.terminal_color_2 = Green
  vim.g.terminal_color_10 = Green
  vim.g.terminal_color_3 = Yellow
  vim.g.terminal_color_11 = Yellow
  vim.g.terminal_color_4 = Blue
  vim.g.terminal_color_12 = Blue
  vim.g.terminal_color_5 = Purple
  vim.g.terminal_color_13 = Purple
  vim.g.terminal_color_6 = Cyan
  vim.g.terminal_color_14 = Cyan

end

local group = vim.api.nvim_create_augroup("RecolorTheme", { clear = true })
vim.api.nvim_create_autocmd("OptionSet", {
  group = group,
  pattern = "background",
  callback = recolor,
})
recolor()


vim.cmd([[
au TermOpen * setlocal nonumber
au TermOpen * setlocal statusline=▀
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

vim.cmd([[
nnoremap <S-ScrollWheelUp> :lua recolor_contrast(1)<CR>
nnoremap <S-ScrollWheelDown> :lua recolor_contrast(-1)<CR>

nnoremap <C-ScrollWheelUp> :lua recolor_darkness(1)<CR>
nnoremap <C-ScrollWheelDown> :lua recolor_darkness(-1)<CR>
]])
