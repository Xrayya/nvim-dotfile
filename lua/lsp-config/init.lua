local lspconfig = require("functions").notifreq("lspconfig", "lsp-config", "error")
if lspconfig == nil then
  return
end


-- opts = {
--   on_attach = require("lsp-config.handlers").on_attach,
--   capabilities = require("lsp-config.handlers").capabilities,
-- }

-- local clangd_opts = require("lsp-config.custom-lsp-settings.sumneko_lua")
-- opts = vim.tbl_deep_extend("force", clangd_opts, opts)

-- lspconfig.sumneko_lua.setup(opts)

require("lsp-config.lsp-settings")
require("lsp-config.handlers").setup()
require("lsp-config.null-ls")

require("lsp-lines").setup()
