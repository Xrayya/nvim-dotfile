local lsps_settings = {}

function lsps_settings.setup()
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")

  local custom_mappings = {
    ["ccls"] = "ccls",
  }

  ---@param servers table
  local function create_lsp_list(servers)
    local mapping = mason_lspconfig.get_mappings().lspconfig_to_mason
    local ensure_installed = {}
    for _, server in pairs(servers) do
      local server_mapping = mapping[server]

      if not server_mapping then
        local custom_server_mapping = custom_mappings[server]

        if not custom_server_mapping then
          vim.notify('No mapping found for "' .. server .. '"', vim.log.levels.ERROR, {
            title = "Xrayya LSPs Settings",
          })
          goto continue
        end

        if vim.fn.executable(custom_server_mapping) < 1 then
          vim.notify(
            '"' .. custom_server_mapping .. '" is not installed and need manual install',
            vim.log.levels.ERROR,
            {
              title = "Xrayya LSPs Settings",
            }
          )
        end
        goto continue
      end

      local server_package = require("mason-registry").get_package(server_mapping)
      if vim.fn.executable(vim.tbl_keys(server_package.spec.bin)[1]) < 1 then
        table.insert(ensure_installed, 1, server)
      end
      ::continue::
    end

    return ensure_installed, servers
  end

  local ensure_installed, ensure_setup = create_lsp_list({
    "lua_ls",
    "jdtls",
    "clangd",
    "ccls",
    "ts_ls",
    "html",
    "cssls",
    "emmet_ls",
    "intelephense",
    "tailwindcss",
    "prismals",
    "rust_analyzer",
    "jsonls",
    "yamlls",
    "lemminx",
    "marksman",
    "texlab",
  })

  -- if vim.fn.has("win32") < 0 then
  --   table.insert(used_servers, "phpactor")
  -- end

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

    if server == "ccls" then
      goto continue
      local ccls_opts = import_custom_lsp_config("ccls")
      opts = vim.tbl_deep_extend("force", opts, ccls_opts)
    end

    if server == "ts_ls" then
      goto continue
      local ts_ls_opts = import_custom_lsp_config("ts_ls")
      opts = vim.tbl_deep_extend("force", opts, ts_ls_opts)
    end

    if server == "jsonls" then
      local jsonls_opts = import_custom_lsp_config("jsonls")
      opts = vim.tbl_deep_extend("force", opts, jsonls_opts)
    end

    if server == "yamlls" then
      local yamlls_opts = import_custom_lsp_config("yamlls")
      opts = vim.tbl_deep_extend("force", opts, yamlls_opts)
    end

    if server == "ltex" then
      local ltex_opts = import_custom_lsp_config("ltex")
      opts = vim.tbl_deep_extend("force", opts, ltex_opts)
    end

    if server == "pylsp" then
      local pylsp_opts = import_custom_lsp_config("pylsp")
      opts = vim.tbl_deep_extend("force", opts, pylsp_opts)
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

return lsps_settings
