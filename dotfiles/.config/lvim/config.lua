-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.leader = ","

lvim.colorscheme = "solarized"
vim.opt.background="light"


lvim.builtin.terminal.open_mapping = "<A-h>"
-- lvim.keys.terminal_mode["<esc><esc>"] = "<C-\\><C-n>"

vim.keymap.set('t', '<esc><esc>', "<C-\\><C-n>", {silent = true})
-- vim.keymap.set('n', '<Space><Space>', "<C-w><C-w>", {silent = true})
vim.keymap.set("i", "<Space><Space>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set('n', '<esc>', "<C-w><C-w>", {silent = true})
vim.keymap.set("n", "<Space>", ":Float<CR>", { noremap = true, silent = true })
vim.keymap.set("x", "<Space>", ":lua Float(\"visual\")<CR>", { noremap = true, silent = true })
vim.keymap.set('n', ';', ":")


vim.opt.termguicolors = true

lvim.lsp.buffer_mappings.insert_mode['<C-n>'] = lvim.lsp.buffer_mappings.insert_mode['<C-space>']


lvim.builtin.treesitter.ensure_installed = {
  "python",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }


lvim.plugins = {
  {"lepture/vim-jinja"},
  {
    "ishan9299/nvim-solarized-lua"
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "hrsh7th/nvim-cmp",
    },
    config = function()
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
    end
  }
}

-- local sources_table = lvim.builtin.cmp.sources
-- sources_table[#sources_table + 1] = { 
--       name = "codeium",
-- }


lvim.builtin.cmp.active = false




-- Float function in Lua
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

-- Close Float
function FloatClose()
  if vim.g.floatbuf then
    pcall(vim.cmd, "bdelete! " .. vim.g.floatbuf)
    vim.g.floatbuf = nil
  end
end


vim.api.nvim_create_user_command("Float", Float, {})
vim.api.nvim_create_user_command("FloatClose", FloatClose, {})

