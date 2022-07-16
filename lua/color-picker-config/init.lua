local color_picker = require("functions").notifreq("color-picker", "color-picker-config", "error")
if color_picker == nil then
  return
end
color_picker.setup()

vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true })
