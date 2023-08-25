local debugger = {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    config = function()
      -- local dap = require("dap")

      require("mason-nvim-dap").setup({
        ensure_installed = { "cppdbg", "python", "javadbg", "javatest" },
        automatic_setup = true,
      })

      -- require("mason-nvim-dap").setup_handlers({
      -- 	function(config)
      -- 		require("mason-nvim-dap").default_setup(config)
      -- 	end,

      -- 	cppdbg = function(source_name)
      -- 		dap.adapters.cppdbg = {
      -- 			id = "cppdbg",
      -- 			type = "executable",
      -- 			command = vim.fn.glob(
      -- 				vim.fn.stdpath("data")
      -- 					.. "\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe"
      -- 			),
      -- 			options = {
      -- 				detached = false,
      -- 			},
      -- 		}
      -- 		dap.configurations.cpp = dap.configurations.cpp or {}
      -- 		table.insert(dap.configurations.cpp, 1, {
      -- 			name = "Cpptools: Launch this file",
      -- 			type = "cppdbg",
      -- 			request = "launch",
      -- 			program = function()
      -- 				-- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      -- 				return vim.fn.expand("%:p:r") .. ".exe"
      -- 			end,
      -- 			cwd = "${workspaceFolder}",
      -- 			stopOnEntry = true,
      -- 		})
      -- 		dap.configurations.c = dap.configurations.cpp
      -- 		dap.configurations.rust = dap.configurations.cpp
      -- 	end,
      -- 	node2 = function(source_name)
      -- 		dap.adapters.node2 = {
      -- 			type = "executable",
      -- 			command = "node",
      -- 			args = {
      -- 				vim.fn.stdpath("data") .. "\\mason\\packages\\node-debug2-adapter\\out\\src\\nodeDebug.js",
      -- 			},
      -- 		}
      -- 		dap.configurations.javascript = dap.configurations.javascript or {}
      -- 		table.insert(dap.configurations.javascript, 1, {
      -- 			name = "Node2: Launch this file",
      -- 			type = "node2",
      -- 			request = "launch",
      -- 			program = "${file}",
      -- 			cwd = vim.fn.getcwd(),
      -- 			sourceMaps = true,
      -- 			protocol = "inspector",
      -- 			console = "integratedTerminal",
      -- 		})
      -- 		table.insert(dap.configurations.javascript, 1, {
      -- 			-- For this to work you need to make sure the node process is started with the `--inspect` flag.
      -- 			name = "Node2: Attach to process",
      -- 			type = "node2",
      -- 			request = "attach",
      -- 			processId = require("dap.utils").pick_process,
      -- 		})

      -- 		dap.configurations.typescript = dap.configurations.javascript
      -- 		dap.configurations.javascriptreact = dap.configurations.javascript
      -- 		dap.configurations.typescriptreact = dap.configurations.javascript
      -- 	end,
      -- 	chrome = function(source_name)
      -- 		dap.adapters.chrome = {
      -- 			type = "executable",
      -- 			command = "node",
      -- 			args = {
      -- 				vim.fn.stdpath("data")
      -- 					.. "\\mason\\packages\\chrome-debug-adapter\\out\\src\\chromeDebug.js",
      -- 			},
      -- 		}
      -- 		dap.configurations.javascript = dap.configurations.javascript or {}
      -- 		table.insert(dap.configurations.javascript, 1, {
      -- 			name = "Chrome: attach",
      -- 			type = "chrome",
      -- 			request = "attach",
      -- 			program = "${file}",
      -- 			cwd = vim.fn.getcwd(),
      -- 			sourceMaps = true,
      -- 			protocol = "inspector",
      -- 			port = 9222,
      -- 			webRoot = "${workspaceFolder}",
      -- 		})
      -- 		dap.configurations.typescript = dap.configurations.javascript
      -- 		dap.configurations.javascriptreact = dap.configurations.javascript
      -- 		dap.configurations.typescriptreact = dap.configurations.javascript
      -- 	end,
      -- })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup()
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
      require("dap").listeners.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end
    end,
  },
}

return debugger
