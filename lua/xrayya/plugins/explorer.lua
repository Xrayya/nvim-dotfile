local icons = LOAD_UTIL("icons")

local explorer = {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local themes = require("telescope.themes")
      local actions = require("telescope.actions")

      local ui = LOAD_UTIL("icons").ui

      require("telescope").setup({
        pickers = {
          buffers = {
            theme = "dropdown",
            previewer = false,
            mappings = {
              n = {
                ["dd"] = actions.delete_buffer,
              },
            },
          },
          diagnostics = {
            layout_strategy = "vertical",
          },
          help_tags = {
            layout_config = {
              preview_width = 0.6,
            },
          },
          lsp_document_symbols = {
            theme = "ivy",
            layout_config = {
              height = 0.4,
            },
          },
          lsp_workspace_symbols = {
            theme = "ivy",
            layout_config = {
              height = 0.4,
            },
          },
          lsp_definitions = {
            theme = "ivy",
            layout_config = {
              height = 0.4,
            },
          },
          lsp_type_definitions = {
            theme = "ivy",
            layout_config = {
              height = 0.4,
            },
          },
          lsp_references = {
            layout_strategy = "vertical",
          },
          lsp_implementations = {
            layout_strategy = "vertical",
          },
        },
        defaults = {
          prompt_prefix = ui.Telescope .. "  ",
          selection_caret = ui.GoTo .. " ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/", "node_modules" },
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
          mappings = {
            i = {
              ["<Tab>"] = actions.move_selection_next,
              ["<S-Tab>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
            },
            n = {
              ["<Tab>"] = actions.move_selection_next,
              ["<S-Tab>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            themes.get_dropdown(),
          },
        },
      })

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "simonmclean/triptych.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("triptych").setup({
        git_signs = {
          signs = {
            add = icons.git.Add,
            modify = icons.git.Mod,
            rename = icons.git.Rename,
            untracked = icons.git.Untracked,
          },
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
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
      })
    end,
  },
}

return explorer
