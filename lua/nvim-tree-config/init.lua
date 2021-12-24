vim.g.nvim_tree_width = 25
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "U",
      ignored = "◌",
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  }

-- require'nvim-tree'.setup ()
require'nvim-tree'.setup {
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    -- folder_arrows = 1,
    tree_width = 25,
  },
}
