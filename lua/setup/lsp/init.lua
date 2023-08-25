local lsp = {
  { "williamboman/mason-lspconfig.nvim" },
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
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      vim.diagnostic.config({
        update_in_insert = true,
      })

      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "jdtls",
          "clangd",
          -- "tsserver",
          "html",
          "cssls",
          "emmet_ls",
        },
      })

      local installed_servers = mason_lspconfig.get_installed_servers()

      local opts = {}

      for _, server in pairs(installed_servers) do
        opts = {
          --on_attach = require("lsp-config.handlers").on_attach,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }

        if server == "lua_ls" then
          local lua_ls_opts = require("setup.lsp.custom-lsp-config.lua_ls")
          opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
        end

        if server == "tsserver" then
          local tsserver_opts = require("setup.lsp.custom-lsp-config.tsserver")
          opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
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

        lspconfig[server].setup(opts)
        ::continue::
      end

      opts = {
        --on_attach = require("lsp-config.handlers").on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }
      local tsserver_opts = require("setup.lsp.custom-lsp-config.tsserver")
      opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
      lspconfig.tsserver.setup(opts)
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting

      null_ls.setup({
        debug = false,
        sources = {
          formatting.prettier.with({
            extra_args = { "--single-quote", "--jsx-single-quote" },
          }),
          formatting.stylua,
        },
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        text = {
          done = "󰄬",
        },
        window = {
          blend = 0,
        },
        fmt = {
          stack_upwards = false,
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
}

return lsp
