local mason_lspconfig = NOTIF_REQ("mason-lspconfig", "mason-config", "error")
if mason_lspconfig == nil then
  return
end

local lspconfig = NOTIF_REQ("lspconfig", "lsp-config.lsp-installer", "error")
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
    "gopls",
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

  if server == "emmet_ls" then
    local emmet_opts = require("lsp-config.custom-lsp-settings.emmet")
    opts = vim.tbl_deep_extend("force", emmet_opts, opts)
  end

  if server == "tsserver" then
    local tsserver_opts = require("lsp-config.custom-lsp-settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)

    local is_ok, extended_typescript = pcall(require, "typescript")
    if is_ok then
      extended_typescript.setup({
        server = opts,
      })
      goto continue
    end

    vim.notify("lsp-config.lsp-settings: failed to setup extended LSP", vim.log.levels.WARN)
    vim.notify("lsp-config.lsp-settings: use default nvim-lspconfig settings", vim.log.levels.INFO)
  end

  if server == "clangd" then
    local clangd_opts = require("lsp-config.custom-lsp-settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if server == "marksman" then
    local marksman_opts = require("lsp-config.custom-lsp-settings.marksman")
    opts = vim.tbl_deep_extend("force", marksman_opts, opts)
  end

  if server == "jsonls" then
    local jsonls_opts = require("lsp-config.custom-lsp-settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "intelephense" then
    local php_opts = require("lsp-config.custom-lsp-settings.php")
    opts = vim.tbl_deep_extend("force", php_opts, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end

-- mason doesn't cover this dart
opts = {
  on_attach = require("lsp-config.handlers").on_attach,
  capabilities = require("lsp-config.handlers").capabilities,
}
local dartls_opt = require("lsp-config.custom-lsp-settings.dartls")
opts = vim.tbl_deep_extend("force", dartls_opt, opts)
lspconfig.dartls.setup(opts)

-- setup clangd manually cuz I install llvm
opts = {
  on_attach = require("lsp-config.handlers").on_attach,
  capabilities = require("lsp-config.handlers").capabilities,
}
local clangd_opts = require("lsp-config.custom-lsp-settings.clangd")
opts = vim.tbl_deep_extend("force", clangd_opts, opts)
lspconfig.clangd.setup(opts)
