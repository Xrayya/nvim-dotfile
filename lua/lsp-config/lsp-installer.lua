local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

lsp_installer.setup({
  ui = {
    border = "rounded",
  },
})

local installed_servers = lsp_installer.get_installed_servers()

local opts = {}

for _, server in pairs(installed_servers) do
  opts = {
    on_attach = require("lsp-config.handlers").on_attach,
    capabilities = require("lsp-config.handlers").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("lsp-config.costume-lsp-settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "jdtls" then
    local jdtls_opts = require("lsp-config.costume-lsp-settings.jdtls")
    opts = {
      on_attach = jdtls_opts.on_attach,
      capabilities = jdtls_opts.capabilities,
    }
  end

  if server.name == "clangd" then
    local clangd_opts = require("lsp-config.costume-lsp-settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls_opts = require("lsp-config.costume-lsp-settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  lspconfig[server.name].setup(opts)
end
