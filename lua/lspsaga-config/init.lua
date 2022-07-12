local lspsaga = require("lspsaga")
lspsaga.setup({ -- defaults ...
  -- Error,Warn,Info,Hint
  diagnostic_header_icon = { " ", " ", " ", " " },
  -- use emoji lightbulb in default
  code_action_icon = "",
  code_action_keys = {
    quit = "<esc>",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<esc>",
    exec = "<CR>",
  },
  border_style = "single",
  rename_prompt_prefix = "﬌",
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-Down>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map("n", "<C-Up>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
