local telescope = require("functions").notifreq("telescope", "telescope-config", "error")
if telescope == nil then
  return
end

local themes = require("telescope.themes")

local ui = require("icons").ui

telescope.setup({
  pickers = {
    lsp_document_symbols = {
      theme = "ivy",
      layout_config = {
        height = 0.4
      },
    },
    lsp_workspace_symbols = {
      theme = "ivy",
      layout_config = {
        height = 0.4
      },
    },
    lsp_definitions = {
      theme = "ivy",
      layout_config = {
        height = 0.4
      },
    },
    lsp_type_definitions = {
      theme = "ivy",
      layout_config = {
        height = 0.4
      },
    },
  },
  defaults = {
    prompt_prefix = ui.Telescope .. " ",
    selection_caret = ui.GoTo .. " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
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
