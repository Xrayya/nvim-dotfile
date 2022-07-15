local handlers = require("lsp-config.handlers")

local M = {}

M.on_attach = function(client, bufnr)
  handlers.lsp_highlight_document(client)
  handlers.attach_navic(client, bufnr)

  local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not cmp_status_ok then
    vim.notify('lsp-config.custom-lsp-settings.jdtlse: failed to load "cmp_nvim_lsp" module')
    return M
  end

  M.capabilities = vim.lsp.protocol.make_client_capabilities()
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
end

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
    },
  },
}

return M
