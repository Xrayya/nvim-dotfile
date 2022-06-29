require("color-picker").setup()

vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true })
