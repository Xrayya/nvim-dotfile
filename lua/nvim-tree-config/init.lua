require 'nvim-tree'.setup {
  update_focused_file = {
    enable = true,
    -- update_cwd = true
  },
  renderer = {
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      git_placement = "after",
      glyphs = {
        default = "",
        symlink = "",
        arrow_open = "",
        folder = {
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "U",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
}
