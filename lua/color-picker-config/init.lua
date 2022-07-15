local status_ok, color_picker = pcall(require, "color-picker")
if not status_ok then
  vim.notify('color-picker-config: failed to load "color-picker" module')
  return
end
color_picker.setup()

vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true })
