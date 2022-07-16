local _ = require("functions").notifreq("lspconfig", "lsp-config", "error")
if _ == nil then
  return
end

require("lsp-config.lsp-installer")
require("lsp-config.handlers").setup()
require("lsp-config.null-ls")
