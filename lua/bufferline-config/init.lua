local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify('bufferline-config: failed load "bufferline" module')
  return
end

bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",

    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or " ")
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

map("n", "<M-l>", ":BufferLineCycleNext<CR>", opts)
map("n", "<M-h>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<M-x>", ":bdelete<CR>", opts)

map("n", "<M->>", ":BufferLineMoveNext<CR>", opts)
map("n", "<M-<>", ":BufferLineMovePrev<CR>", opts)
