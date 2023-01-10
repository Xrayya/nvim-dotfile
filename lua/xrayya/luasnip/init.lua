local luasnip = NOTIF_REQ("luasnip", "xrayya.luasnip", "error")
if luasnip == nil then
  return
end

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("i", "<M-l>", "<cmd>lua require('luasnip').expand_or_jump()<cr>", opts)
map("i", "<M-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
map("s", "<M-l>", "<cmd>lua require('luasnip').jump(1)<cr>", opts)
map("s", "<M-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
map("i", "<M-L>", "<cmd>lua require('luasnip').change_choice(1)<cr>", opts)
map("i", "<M-H>", "<cmd>lua require('luasnip').change_choice(-1)<cr>", opts)
map("s", "<M-L>", "<cmd>lua require('luasnip').change_choice(1)<cr>", opts)
map("s", "<M-H>", "<cmd>lua require('luasnip').change_choice(-1)<cr>", opts)
