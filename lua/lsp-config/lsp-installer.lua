local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local installed_servers = lsp_installer.get_installed_servers()

-- local servers = {
--   "sumneko_lua",
--   "cssls",
--   "html",
--   "tsserver",
-- }

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(installed_servers) do
  opts = {
    on_attach = require("lsp-config.handlers").on_attach,
    capabilities = require("lsp-config.handlers").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require "lsp-config.costume-lsp-settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  lspconfig[server.name].setup(opts)
end
