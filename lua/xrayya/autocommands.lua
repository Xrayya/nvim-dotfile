local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("4Tab", { clear = true })
autocmd("FileType", {
  group = "4Tab",
  pattern = { "java", "php" },
  command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4",
})
