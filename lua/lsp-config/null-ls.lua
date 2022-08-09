local null_ls = NOTIF_REQ("null-ls", "lsp-config.null-ls", "error")
if null_ls == nil then
  return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

-- local prettier_args = { "--single-quote", "--jsx-single-quote" }
-- if vim.bo.filetype == "javascript" then
--   prettier_args = { "--single-quote", "--jsx-single-quote" }
-- end

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_args = { "--single-quote", "--jsx-single-quote" },
    }),
    formatting.stylua,
  },
})
