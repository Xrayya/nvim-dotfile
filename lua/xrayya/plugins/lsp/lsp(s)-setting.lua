local lsps_setting = {}

function lsps_setting.setup()
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")

  local function create_lsp_list(servers)
    local mapping = require("mason-lspconfig").get_mappings().lspconfig_to_mason
    local ensure_installed = {}
    local ensure_setup = servers
    for _, server in pairs(servers) do
      local server_package = require("mason-registry").get_package(mapping[server])
      if vim.fn.executable(vim.tbl_keys(server_package.spec.bin)[1]) < 1 then
        table.insert(ensure_installed, 1, server)
      end
    end

    return ensure_installed, ensure_setup
  end

  local ensure_installed, ensure_setup = create_lsp_list({
    "lua_ls",
    "jdtls",
    "clangd",
    "tsserver",
    "html",
    "cssls",
    "emmet_ls",
    "tailwindcss",
    "prismals",
    "rust_analyzer",
    "jsonls",
    "yamlls",
    "lemminx",
    "ltex"
  })

  mason_lspconfig.setup({
    ensure_installed = ensure_installed,
  })

  ensure_setup = MERGE_TABLE_AS_SET(ensure_setup, require("mason-lspconfig").get_installed_servers())

  local opts = {}

  local import_custom_lsp_config = function(server)
    return require("xrayya.plugins.lsp.custom-lsp-config." .. server)
  end

  for _, server in pairs(ensure_setup) do
    opts = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    }

    if server == "lua_ls" then
      local lua_ls_opts = import_custom_lsp_config("lua_ls")
      opts = vim.tbl_deep_extend("force", opts, lua_ls_opts)
    end

    if server == "clangd" then
      local clangd_opts = import_custom_lsp_config("clangd")
      opts = vim.tbl_deep_extend("force", opts, clangd_opts)
    end

    if server == "tsserver" then
      goto continue
      local tsserver_opts = import_custom_lsp_config("tsserver")
      opts = vim.tbl_deep_extend("force", opts, tsserver_opts)
    end

    if server == "jsonls" then
      local jsonls_opts = import_custom_lsp_config("jsonls")
      opts = vim.tbl_deep_extend("force", opts, jsonls_opts)
    end

    if server == "yamlls" then
      local yamlls_opts = import_custom_lsp_config("yamlls")
      opts = vim.tbl_deep_extend("force", opts, yamlls_opts)
    end

    if server == "phpactor" then
      local phpactor_opts = import_custom_lsp_config("phpactor")
      opts = vim.tbl_deep_extend("force", opts, phpactor_opts)
    end

    if server == "dartls" then
      goto continue
    end

    if server == "jdtls" then
      goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
  end
end

return lsps_setting
