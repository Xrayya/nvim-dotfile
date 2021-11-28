-- -- Find files using Telescope command-line sugar.
-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
-- map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
-- map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
-- map('n', '<leader>ft', '<cmd>Telescope help_tags<cr>', opts)

-- local wk = require("which-key")

-- wk.register = ({
--   ["<leader>"] = {
--     f = {
--       name = "+Find",
--       b = { "<cmd>Telescope buffers<cr>", "Buffer" },
--       c = { "<cmd>Telescope commands<cr>", "Commands" },
--       f = { "<cmd>Telescope find_files<cr>", "File" },
--       g = { "<cmd>Telescope live_grep<cr>", "Find grep" },
--       n = { "<cmd>enew<cr>", "New File" },
--       r = { "<cmd>Telescope oldfiles<cr>", "Recent file" },
--       s = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--       t = { "<cmd>Telescope help_tags<cr>", "Tags" }
--     },
--   }
-- })
