local lsp = {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({
        ui = {
          border = "rounded",
        },
        outline = {
          win_width = 35,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "williamboman/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      local diagnostic_signs = LOAD_UTIL("icons").diagnostics
      local signs = {
        { name = "DiagnosticSignError", text = diagnostic_signs.Error },
        { name = "DiagnosticSignWarn", text = diagnostic_signs.Warning },
        { name = "DiagnosticSignHint", text = diagnostic_signs.Hint },
        { name = "DiagnosticSignInfo", text = diagnostic_signs.Information },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      vim.diagnostic.config({
        update_in_insert = true,
        signs = {
          active = signs,
        },
        float = {
          border = "rounded",
          source = "always",
        },
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })

      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      local function create_lsp_list(servers)
        local mapping = require("mason-lspconfig").get_mappings().lspconfig_to_mason
        local ensure_installed = {}
        local ensure_setup = servers
        for _, server in pairs(servers) do
          local server_package = require("mason-registry").get_package(mapping[server])
          if vim.fn.executable(GET_KEYS(server_package.spec.bin)[1]) < 1 then
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
      })

      mason_lspconfig.setup({
        ensure_installed = ensure_installed,
      })

      vim.tbl_deep_extend("force", ensure_setup, require("mason-lspconfig").get_installed_servers())

      local opts = {}

      local import_custom_lsp_config = function(server)
        return require("xrayya.setup.lsp.custom-lsp-config." .. server)
      end

      for _, server in pairs(ensure_setup) do
        opts = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }

        if server == "lua_ls" then
          local lua_ls_opts = import_custom_lsp_config("lua_ls")
          opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
        end

        if server == "clangd" then
          local clangd_opts = import_custom_lsp_config("clangd")
          opts = vim.tbl_deep_extend("force", clangd_opts, opts)
        end

        if server == "tsserver" then
          goto continue
          local tsserver_opts = import_custom_lsp_config("tsserver")
          opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
        end

        if server == "jsonls" then
          local jsonls = import_custom_lsp_config("jsonls")
          opts = vim.tbl_deep_extend("force", jsonls, opts)
        end

        if server == "yamlls" then
          local yamlls = import_custom_lsp_config("yamlls")
          opts = vim.tbl_deep_extend("force", yamlls, opts)
        end

        if server == "jdtls" then
          goto continue
        end

        lspconfig[server].setup(opts)
        ::continue::
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "prettier" },
        automatic_installation = true,
      })

      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting

      null_ls.setup({
        debug = false,
        sources = {
          formatting.prettier,
          formatting.stylua,
        },
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({
        notification = {
          view = {
            stack_upwards = false,
          },
          window = {
            winblend = 0,
          },
        },
      })
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    init = function()
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { only_current_line = true },
      })
    end,
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "anticonceal",
    config = function()
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })

      require("lsp-inlayhints").setup()
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  require("xrayya.setup.lsp.advanced-lsp-config"),
}

return lsp
