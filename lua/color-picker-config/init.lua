require("color-picker").setup()

vim.keymap.set("i", "<C-S-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true })
