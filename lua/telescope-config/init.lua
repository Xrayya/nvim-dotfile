local telescope = require("functions").notifreq("telescope", "telescope-config", "error")
if telescope == nil then
  return
end

telescope.load_extension("projects")
telescope.load_extension("toggletasks")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
  },
})
