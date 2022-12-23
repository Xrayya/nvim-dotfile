vim.api.nvim_create_autocmd({
  "BufWinEnter",
  pattern = { "*.class" },
  callback = function()
    vim.cmd("set ft=java<cr>")
  end,
})
