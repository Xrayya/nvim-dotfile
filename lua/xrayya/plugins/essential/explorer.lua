local icons = LOAD_UTIL("icons")

---@type LazySpec
return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "simonmclean/triptych.nvim",
    event = "VeryLazy",
    opts = {
      git_signs = {
        signs = {
          add = icons.git.Add,
          modify = icons.git.Mod,
          rename = icons.git.Rename,
          untracked = icons.git.Untracked,
        },
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        width = 35,
      },
      renderer = {
        root_folder_label = ":t",
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "before",
          glyphs = {
            default = icons.ui.File,
            symlink = icons.ui.Symlink,
            -- stylua : ignore
            folder = {
              arrow_open = icons.ui.ArrowOpen,
              arrow_closed = icons.ui.ArrowClosed,
              default = icons.documents.Folder,
              open = icons.documents.FolderOpen,
              empty = icons.documents.EmptyFolder,
              empty_open = icons.documents.EmptyFolderOpen,
              symlink = icons.documents.SymlinkFolder,
              symlink_open = icons.documents.SymlinkFolder,
            },
            git = {
              unstaged = icons.git.Mod,
              staged = icons.git.Staged,
              unmerged = icons.git.Unmerged,
              renamed = icons.git.Rename,
              untracked = icons.git.Untracked,
              deleted = icons.git.Remove,
              ignored = icons.git.Ignore,
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = icons.diagnostics.outlined.Hint,
          info = icons.diagnostics.outlined.Information,
          warning = icons.diagnostics.outlined.Warning,
          error = icons.diagnostics.outlined.Error,
        },
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 500,
      },
    },
  },
}
