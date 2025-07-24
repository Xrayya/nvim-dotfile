local autocmd = vim.api.nvim_create_autocmd

--- @param name string
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

autocmd("FileType", {
  group = augroup("4_tab"),
  pattern = { "java", "php" },
  command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4",
})

autocmd("FileType", {
  group = augroup("wrap"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})
