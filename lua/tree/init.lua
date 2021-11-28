vim.g.nvim_tree_width = 25
vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_icons = {
--   default = '',
--   symlink = '',
--   git = {
--     unstaged = "[M]",
--     staged = "[A]",
--     unmerged = "",
--     renamed = "➜",
--     untracked = "[U]",
--     deleted = "",
--     ignored = "◌"
--     },
--   folder = {
--     arrow_open = "",
--     arrow_closed = "",
--     symlink = "",
--     symlink_open = "",
--     }
-- }

require'nvim-tree'.setup ()
-- require'nvim-tree'.setup {
--   diagnostics = {
--     enable = false,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     }
--   },
-- }
