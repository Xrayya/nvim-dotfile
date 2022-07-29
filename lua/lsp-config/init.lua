local lspconfig = require("functions").notifreq("lspconfig", "lsp-config", "error")
if lspconfig == nil then
  return
end

require("lsp-config.lsp-settings")
require("lsp-config.handlers").setup()
require("lsp-config.null-ls")

require("lsp-lines").setup()
