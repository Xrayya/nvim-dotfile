local telescope = {
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
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local themes = require("telescope.themes")
      local actions = require("telescope.actions")

      local ui = LOAD_UTIL("icons").ui

      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
          },
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
          colorscheme = {
            enable_preview = true,
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
    "prochri/telescope-all-recent.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = true,
  },
}

return telescope
