local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Space>', 'NOP', opts)
vim.g.mapleader = " "

-- no hl
map('n', '<Leader>h', ':set hlsearch!<CR>', opts)

-- Use alt + hjkl to resize windows
map('n', '<M-Down>',  ':resize -1<CR>', opts)
map('n', '<M-Up>',    ':resize +1<CR>', opts)
map('n', '<M-Right>', ':vertical resize -1<CR>', opts)
map('n', '<M-Left>',  ':vertical resize +1<CR>', opts)

-- Easy CAPS
map('i', '<C-u>', '<ESC>viwUi', opts)
map('n', '<C-u>', 'viwU<ESC>', opts)

-- Set command to enter visual block mode (since <C-v> always do paste)
vim.cmd('command! Vb normal! <C-v>')

-- TAB in normal mode will move to text buffer
--map('n', '<TAB>',   ':bnext<CR>', opts)
-- SHIFT-TAB will go back
--map('n', '<S-TAB>', ':bprevious<CR>', opts)
-- CTRL-W to close current buffer
--map('n', '<C-W>',   ':bdelete<CR>', opts)

-- <TAB> COomplete
map('i', '<expr> <TAB>', 'pumvisible() ? \"\\<C-n>\" : \"\\<TAB>\"', opts)

-- Better indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move selecter line /block of text in visual mode
map('x', 'J',     ':move \'<+2<CR>gv=gv', opts)
map('x', 'K',     ':move \'<-2<CR>gv=gv', opts)
map('i', '<C-j>', '<esc>:move .+1<CR>==i', opts)
map('i', '<C-k>', '<esc>:move .-2<CR>==i', opts)
map('n', '<M-j>', ':move .+1<CR>==', opts)
map('n', '<M-k>', ':move .-2<CR>==', opts)

-- Undo break point
map('i', '.', '.<C-g>u', opts)
map('i', ',', ',<C-g>u', opts)
map('i', '=', '=<C-g>u', opts)
map('i', '<', '<<C-g>u', opts)
map('i', '>', '><C-g>u', opts)
map('i', '(', '(<C-g>u', opts)
map('i', '{', '{<C-g>u', opts)
map('i', '[', '[<C-g>u', opts)
map('i', '/', '/<C-g>u', opts)
map('i', ';', ';<C-g>u', opts)

-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
