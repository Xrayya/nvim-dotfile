--- @param mode string | string[]
--- @param lhs string
--- @param rhs string | function Parameter description.
local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

map("", "<Space>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use alt + hjkl to resize windows
map("n", "<M-Down>", ":resize -1<CR>")
map("n", "<M-Up>", ":resize +1<CR>")
map("n", "<M-Right>", ":vertical resize +1<CR>")
map("n", "<M-Left>", ":vertical resize -1<CR>")

-- Set command to enter visual block mode (since <C-v> always do paste)
vim.cmd("command! Vb normal! <C-v>")

-- Escape from terminal mode
map("t", "<esc><esc>", "<C-\\><c-n>")

-- -- Useful for switching between floating windows
map("n", "<M-]>", ":cnext<CR>")
map("n", "<M-[>", ":cprevious<CR>")

-- <TAB> Completion
map("i", "<expr> <TAB>", 'pumvisible() ? "\\<C-n>" : "\\<TAB>"')
map("i", "<expr> <S-TAB>", 'pumvisible() ? "\\<C-p>" : "\\<TAB>"')

-- Keep it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Keep the last thing yanked on the register
map("v", "p", '"_dP')

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selecter line /block of text in visual mode
map("x", "<M-j>", ":move '>+1<CR>gv-gv")
map("x", "<M-k>", ":move '<-2<CR>gv-gv")
map("i", "<C-j>", "<esc>:move .+1<CR>==i")
map("i", "<C-k>", "<esc>:move .-2<CR>==i")
map("n", "<M-j>", ":move .+1<CR>==")
map("n", "<M-k>", ":move .-2<CR>==")

-- Undo break point
map("i", ".", ".<C-g>u")
map("i", ",", ",<C-g>u")
map("i", "=", "=<C-g>u")
map("i", "+", "+<C-g>u")
map("i", "-", "-<C-g>u")
map("i", "*", "*<C-g>u")
map("i", "%", "%<C-g>u")
map("i", "<", "<<C-g>u")
map("i", ">", "><C-g>u")
map("i", "(", "(<C-g>u")
map("i", "{", "{<C-g>u")
map("i", "[", "[<C-g>u")
map("i", '"', '"<C-g>u')
map("i", "'", "'<C-g>u")
map("i", "`", "`<C-g>u")
map("i", "/", "/<C-g>u")
map("i", "|", "|<C-g>u")
map("i", "?", "?<C-g>u")
map("i", "!", "!<C-g>u")
map("i", ";", ";<C-g>u")
map("i", ":", ":<C-g>u")
map("i", " ", " <C-g>u")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Split windows
map("n", "<C-\\>", ":vsplit<CR>")
map("n", "<A-\\>", ":split<CR>")

vim.keymap.set(
  "n",
  "<leader>=",
  ":setlocal relativenumber number signcolumn=yes<cr>",
  { noremap = true, silent = true, desc = "Set essential options for current buffer" }
)
