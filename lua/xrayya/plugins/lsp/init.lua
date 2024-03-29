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
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      local diagnostic_signs = LOAD_UTIL("icons").diagnostics
      local signs = {
        { name = "DiagnosticSignError", text = diagnostic_signs.outlined.Error },
        { name = "DiagnosticSignWarn", text = diagnostic_signs.outlined.Warning },
        { name = "DiagnosticSignHint", text = diagnostic_signs.outlined.Hint },
        { name = "DiagnosticSignInfo", text = diagnostic_signs.outlined.Information },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      vim.diagnostic.config({
        update_in_insert = true,
        severity_sort = true,
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

      require("xrayya.plugins.lsp.lsp(s)-setting").setup()
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

      vim.g.lsp_line_enabled = true
    end,
    config = function()
      require("lsp_lines").setup()

      vim.api.nvim_create_user_command("LspLineToggle", function(args)
        if vim.g.lsp_line_enabled then
          vim.diagnostic.config({ virtual_lines = false })
          vim.g.lsp_line_enabled = false
        else
          vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
          vim.g.lsp_line_enabled = true
        end
      end, {})
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

      vim.api.nvim_create_user_command("LspInlayHintsToggle", function(args)
        require("lsp-inlayhints").toggle()
      end, {})
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  require("xrayya.plugins.lsp.advanced-lsp-config"),
}

return lsp
