return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {},
    config = function(_, opts)
      local themes = require("telescope.themes")
      local actions = require("telescope.actions")

      local ui = LOAD_UTIL("icons").ui

      local telescope = require("telescope")

      local telescope_config = {
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
            layout_strategy = "vertical",
            hidden = true,
            no_ignore = true,
            jump_type = "never",
          },
          lsp_type_definitions = {
            layout_strategy = "vertical",
            hidden = true,
            no_ignore = true,
            jump_type = "never",
          },
          lsp_references = {
            layout_strategy = "vertical",
            hidden = true,
            no_ignore = true,
            jump_type = "never",
          },
          lsp_implementations = {
            layout_strategy = "vertical",
            hidden = true,
            no_ignore = true,
            jump_type = "never",
          },
          colorscheme = {
            enable_preview = true,
          },
        },
        defaults = {
          prompt_prefix = ui.Telescope .. "  ",
          selection_caret = ui.GoTo .. " ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/" },
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
      }

      telescope_config = vim.tbl_deep_extend("force", telescope_config, opts)

      telescope.setup(telescope_config)

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
  },
  {
    "prochri/telescope-all-recent.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
    },
    opts = {},
  },
}
