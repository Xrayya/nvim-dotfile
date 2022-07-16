local handlers = require("lsp-config.handlers")

local M = {}

M.opts = {
  settings = {
    java = {
      signatureHelp = {
        enable = true,
        description = {
          enable = true,
        },
      },
      contentProvider = {
        preferred = "fernflower",
      },
      completion = {
        guessMethodArguments = true,
      },
    },
  },
}

M.on_attach = function(client, bufnr)
  handlers.lsp_highlight_document(client)
  handlers.attach_navic(client, bufnr)

  M.capabilities = vim.lsp.protocol.make_client_capabilities()
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true

  local cmp_nvim_lsp = require("functions").notifreq("cmp_nvim_lsp", "lsp-config.custom-lsp-settings.jdtls", "error")
  if cmp_nvim_lsp ~= nil then
    M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
  end
end

return M
