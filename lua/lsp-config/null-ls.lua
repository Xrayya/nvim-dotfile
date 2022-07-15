local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify('lsp-config.null-ls: failed to load "null-ls" module')
  return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

local prettier_args = { "-- parser " .. vim.bo.filetype, "--single-quote", "--jsx-single-quote" }

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_args = prettier_args,
    }),
    formatting.stylua,
  },
})
