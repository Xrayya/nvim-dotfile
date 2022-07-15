local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify('telescope-config: failed to load "telescope" module')
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
