local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use alt + hjkl to resize windows
map("n", "<M-Down>", ":resize -1<CR>", opts)
map("n", "<M-Up>", ":resize +1<CR>", opts)
map("n", "<M-Right>", ":vertical resize +1<CR>", opts)
map("n", "<M-Left>", ":vertical resize -1<CR>", opts)

-- Set command to enter visual block mode (since <C-v> always do paste)
vim.cmd("command! Vb normal! <C-v>")

-- Escape from terminal mode
map("t", "<esc><esc>", "<C-\\><c-n>", opts)

-- -- Useful for switching between floating windows
map("n", "<M-]>", ":cnext<CR>", opts)
map("n", "<M-[>", ":cprevious<CR>", opts)

-- <TAB> Completion
map("i", "<expr> <TAB>", 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', opts)
map("i", "<expr> <S-TAB>", 'pumvisible() ? "\\<C-p>" : "\\<TAB>"', opts)

-- Keep it centered
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- Keep the last thing yanked on the register
map("v", "p", '"_dP', opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move selecter line /block of text in visual mode
map("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)
map("i", "<C-j>", "<esc>:move .+1<CR>==i", opts)
map("i", "<C-k>", "<esc>:move .-2<CR>==i", opts)
map("n", "<M-j>", ":move .+1<CR>==", opts)
map("n", "<M-k>", ":move .-2<CR>==", opts)

-- Undo break point
map("i", ".", ".<C-g>u", opts)
map("i", ",", ",<C-g>u", opts)
map("i", "=", "=<C-g>u", opts)
map("i", "+", "+<C-g>u", opts)
map("i", "-", "-<C-g>u", opts)
map("i", "*", "*<C-g>u", opts)
map("i", "%", "%<C-g>u", opts)
map("i", "<", "<<C-g>u", opts)
map("i", ">", "><C-g>u", opts)
map("i", "(", "(<C-g>u", opts)
map("i", "{", "{<C-g>u", opts)
map("i", "[", "[<C-g>u", opts)
map("i", '"', '"<C-g>u', opts)
map("i", "'", "'<C-g>u", opts)
map("i", "`", "`<C-g>u", opts)
map("i", "/", "/<C-g>u", opts)
map("i", "|", "|<C-g>u", opts)
map("i", "?", "?<C-g>u", opts)
map("i", "!", "!<C-g>u", opts)
map("i", ";", ";<C-g>u", opts)
map("i", ":", ":<C-g>u", opts)
map("i", " ", " <C-g>u", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Split windows
map("n", "<C-\\>", ":vsplit<CR>", opts)
map("n", "<A-\\>", ":split<CR>", opts)

map("n", "]q", ":cnext<CR>", opts)
map("n", "[q", ":cprevious<CR>", opts)

map(
  "n",
  "<leader>=",
  ":setlocal relativenumber number signcolumn=yes<cr>",
  { noremap = true, silent = true, desc = "Set essential options for current buffer" }
)
