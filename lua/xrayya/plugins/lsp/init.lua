local lsp = {
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

      vim.g.diag_virtual_text_enabled = true
      vim.g.diag_virtual_line_enabled = true

      vim.diagnostic.config({
        update_in_insert = true,
        severity_sort = true,
        signs = {
          active = signs,
        },
        float = {
          border = "rounded",
          source = true,
        },
        virtual_text = vim.g.diag_virtual_text_enabled,
        virtual_lines = {
          current_line = vim.g.diag_virtual_line_enabled,
        },
      })

      vim.api.nvim_create_user_command("DiagnosticVirtualTextToggle", function(args)
        if vim.g.diag_virtual_text_enabled then
          vim.diagnostic.config({ virtual_text = false })
          vim.g.diag_virtual_text_enabled = false
        else
          vim.diagnostic.config({ virtual_text = true })
          vim.g.diag_virtual_text_enabled = true
        end
      end, {})

      vim.api.nvim_create_user_command("DiagnosticVirtualLineToggle", function(args)
        if vim.g.diag_virtual_line_enabled then
          vim.diagnostic.config({ virtual_lines = false })
          vim.g.diag_virtual_line_enabled = false
        else
          vim.diagnostic.config({ virtual_lines = { current_line = true } })
          vim.g.diag_virtual_line_enabled = true
        end
      end, {})

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({
        border = "rounded",
      })

      vim.lsp.inlay_hint.enable(true)

      vim.api.nvim_create_user_command("LspInlayHintsToggle", function(args)
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
      end, {})

      require("xrayya.plugins.lsp.lsp(s)-settings").setup()
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
          formatting.blade_formatter,
        },
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    enabled = false,
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
    "mfussenegger/nvim-jdtls",
  },
  require("xrayya.plugins.lsp.advanced-lsp-config"),
  {
    "folke/lazydev.nvim",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        "nvim-dap-ui",
      },
    },
  },
}

return lsp
