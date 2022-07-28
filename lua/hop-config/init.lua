require("hop").setup()
vim.api.nvim_set_keymap(
  "",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR})<cr>",
  {}
)
