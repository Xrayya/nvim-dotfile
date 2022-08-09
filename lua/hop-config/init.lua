require("hop").setup()

vim.keymap.set(
  {"n", "v"},
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>",
  {}
)
vim.keymap.set(
  {"n", "v"},
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR})<cr>",
  {}
)
