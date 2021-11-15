require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        --highlight = "Directory"
      }
    }
    --separator_style = "slant"
  }
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<M-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<M-h>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<M-x>', ':bdelete<CR>', opts)

map('n', '<M->>', ':BufferLineMoveNext<CR>', opts)
map('n', '<M-<>', ':BufferLineMovePrev<CR>', opts)
