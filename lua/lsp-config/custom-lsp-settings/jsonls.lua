local opts = {
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
        end,
      },
    },
  },
}

local schemastore = NOTIF_REQ("schemastore", "lsp-config.custom-lsp-settings.jsonls", "error")
if schemastore == nil then
  vim.notify("jsonls LSP: using default settings", "info", {
    title = "nvim config file: info",
  })

  return opts
end

local update_opts = {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
}

opts = vim.tbl_deep_extend("force", update_opts, opts)

return opts
