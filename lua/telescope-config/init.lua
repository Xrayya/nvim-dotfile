local telescope = NOTIF_REQ("telescope", "telescope-config", "error")
if telescope == nil then
  return
end

local themes = require("telescope.themes")
local actions = require("telescope.actions")

local ui = require("icons").ui

telescope.setup({
  pickers = {
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      mappings = {
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
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
  },
  defaults = {
    prompt_prefix = ui.Telescope .. " ",
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
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      themes.get_dropdown({
        -- even more opts
      }),
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("toggletasks")
telescope.load_extension("projects")
