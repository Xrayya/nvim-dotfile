local mason_lspconfig = require("functions").notifreq("mason-lspconfig", "mason-config", "error")
if mason_lspconfig == nil then
  return
end

local lspconfig = require("functions").notifreq("lspconfig", "lsp-config.lsp-installer", "error")
if lspconfig == nil then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "sumneko_lua",
    "jdtls",
    -- "clangd",
    "tsserver",
    "html",
    "cssls",
    "emmet_ls",
    "marksman",
    "jsonls",
    "vimls",
  },
})

local installed_servers = mason_lspconfig.get_installed_servers()

local opts = {}

for _, server in pairs(installed_servers) do
  opts = {
    on_attach = require("lsp-config.handlers").on_attach,
    capabilities = require("lsp-config.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require("lsp-config.custom-lsp-settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "jdtls" then
    -- local jdtls_opts = require("lsp-config.custom-lsp-settings.jdtls_lspconfig")
    -- opts = {
    --   on_attach = jdtls_opts.on_attach,
    --   capabilities = jdtls_opts.capabilities,
    -- }

    -- opts = vim.tbl_deep_extend("force", jdtls_opts.opts, opts)
    goto continue
  end

  if server == "tsserver" then
    local tsserver_opts = require("lsp-config.custom-lsp-settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "clangd" then
    local clangd_opts = require("lsp-config.custom-lsp-settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if server == "jsonls" then
    local jsonls_opts = require("lsp-config.custom-lsp-settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end

-- setup clangd manually cuz I install llvm

opts = {
  on_attach = require("lsp-config.handlers").on_attach,
  capabilities = require("lsp-config.handlers").capabilities,
}

local clangd_opts = require("lsp-config.custom-lsp-settings.clangd")
opts = vim.tbl_deep_extend("force", clangd_opts, opts)

lspconfig.clangd.setup(opts)
