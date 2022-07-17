local lspsaga = require("functions").notifreq("lspsaga", "lspsaga-config", "error")
if lspsaga == nil then
  return
end

local diagnostic_signs = require("icons").diagnostics

lspsaga.setup({ -- defaults ...
  -- Error,Warn,Info,Hint
  diagnostic_header_icon = {
    diagnostic_signs.Error .. " ",
    diagnostic_signs.Warning .. " ",
    diagnostic_signs.Hint .. " ",
    diagnostic_signs.Information .. " ",
  },
  rename_action_keys = {
    quit = "<esc>",
    exec = "<CR>",
  },
  border_style = "single",
  rename_prompt_prefix = require("icons").ui.Enter,
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-Down>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map("n", "<C-Up>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
