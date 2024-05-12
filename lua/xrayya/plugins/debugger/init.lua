local debugger = {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "cppdbg", "javadbg", "javatest", "dart" },
        handlers = require("xrayya.plugins.debugger.handlers"),
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
        config = function()
          local layouts = require("xrayya.plugins.debugger.layouts")
          local function setup_dap_with_layout(layout)
            require("dapui").setup({
              layouts = layout,
            })
          end

          setup_dap_with_layout(layouts.running_console)

          vim.api.nvim_create_user_command("DapSetupRunningConsole", function(args)
            setup_dap_with_layout(layouts.running_console)
          end, {})
          vim.api.nvim_create_user_command("DapSetupRunning", function(args)
            setup_dap_with_layout(layouts.running)
          end, {})
          vim.api.nvim_create_user_command("DapSetupDebugging", function(args)
            setup_dap_with_layout(layouts.debugging)
          end, {})
          vim.api.nvim_create_user_command("DapSetupDebuggingConsole", function(args)
            setup_dap_with_layout(layouts.debugging_console)
          end, {})
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup({
            only_first_definition = false,
            all_references = true,
          })
        end,
      },
    },
    config = function()
      require("dap").listeners.before.attach.dapui_config = function()
        require("dapui").open()
      end
      require("dap").listeners.before.launch.dapui_config = function()
        require("dapui").open()
      end
    end,
  },
}

return debugger
