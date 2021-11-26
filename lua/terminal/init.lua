-- let g:floaterm_title=""
-- let g:floaterm_shell="powershell.exe -NoLogo"

-- tnoremap <silent> <M-i> <C-\><C-n>:FloatermToggle<CR>
-- noremap <silent> <M-i> :FloatermToggle<CR>

vim.g.floaterm_title = ""
vim.g.floaterm_shell = "powershell.exe -NoLogo"

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<M-i>', ':FloatermToggle<CR>', opts)
map('t', '<M-i>', '<C-\\><C-n>:FloatermToggle<CR>', opts)
