local bufferline = require("functions").notifreq("bufferline", "bufferline-config", "error")
if bufferline == nil then
  return
end

local diagnostics_signs = require("icons").diagnostics

bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",

    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and diagnostics_signs.Error .. " "
          or (e == "warning" and diagnostics_signs.Warning .. " " or diagnostics_signs.Hint .. " ")
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        --highlight = "Directory"
      },
    },
    separator_style = "thick",
  },
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- map("n", "<M-l>", ":BufferLineCycleNext<CR>", opts)
-- map("n", "<M-h>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<M-x>", ":bdelete<CR>", opts)

map("n", "<M->>", ":BufferLineMoveNext<CR>", opts)
map("n", "<M-<>", ":BufferLineMovePrev<CR>", opts)
