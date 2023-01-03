local typescript = NOTIF_REQ("typescript", "lsp-config.custom-lsp-settings.typescript", "error")
if typescript == nil then
  return
end

M = {}

M.setup = function()
  typescript.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
      fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
      require("lsp-config.custom-lsp-settings.tsserver"),
    },
  })
end

return M
