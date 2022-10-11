local handlers = require("lsp-config.handlers")

local M = {}

M.opts = {
  settings = {
    java = {
      inlayHints = {
        parameterNames = {
          enabled = true,
        },
      },
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

  local cmp_nvim_lsp = NOTIF_REQ("cmp_nvim_lsp", "lsp-config.custom-lsp-settings.jdtls_lspconfig", "error")
  if cmp_nvim_lsp ~= nil then
    M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
  end

  -- vim.lsp.codelens.refresh()
  if JAVA_DAP_ACTIVE then
    require("jdtls.dap").setup_dap_main_class_configs()
  end
end

return M
