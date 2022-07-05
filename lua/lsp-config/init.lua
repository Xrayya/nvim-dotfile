local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- lspconfig.clangd.setup{}

require("lsp-config.lsp-installer")
require("lsp-config.handlers").setup()
