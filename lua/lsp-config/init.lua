local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify('lsp-config: failed to load "lspconfig" module')
  return
end

require("lsp-config.lsp-installer")
require("lsp-config.handlers").setup()
require("lsp-config.null-ls")
