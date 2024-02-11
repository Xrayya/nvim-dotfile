local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("4Tab", { clear = true })
autocmd("FileType", {
  group = "4Tab",
  pattern = { "c", "cpp", "java", "php" },
  command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4",
})

augroup("winbar", { clear = true })
autocmd("BufWinEnter", {
  group = "winbar",
  pattern = { "[^NvimTree*]" },
  callback = function(args)
    vim.opt_local.winbar = (vim.fn.expand("%:t") or vim.bo.filetype)
  end,
})
