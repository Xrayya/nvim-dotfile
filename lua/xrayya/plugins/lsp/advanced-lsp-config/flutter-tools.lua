local flutter_tools = {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    require("flutter-tools").setup({
      debugger = {
        enabled = true,
        run_via_dap = true,
      },
      dev_log = {
        enabled = false,
      },
      fvm = true,
      lsp = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
      settings = {
        renameFilesWithClasses = "always",
      },
      widget_guides = {
        enabled = true,
      },
    })

    local dap = require("dap")

    vim.api.nvim_create_user_command("FlutterHotReload", function(args)
      if dap.status() ~= "" then
        dap.repl.execute(".hot-reload")
      end
    end, {})

    vim.api.nvim_create_augroup("FlutterHotReload", {})
    vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
      pattern = { "*.dart" },
      group = "FlutterHotReload",
      callback = function(args)
        vim.cmd("FlutterHotReload")
      end,
    })

    -- vim.cmd("DapSetupRunning")
  end,
}

return flutter_tools
