local debugger_config = {
	function(config)
		require("mason-nvim-dap").default_setup(config)
	end,

	cppdbg = function(config)
		local cppdbg_path = "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
		if vim.fn.has("win32") > 0 then
			cppdbg_path = cppdbg_path:gsub("/", "\\") .. ".exe"
		end

		config.adapters = {
			id = "cppdbg",
			type = "executable",
			command = vim.fn.stdpath("data") .. cppdbg_path,
			options = {
				detached = false,
			},
		}
		config.configurations = {}
		table.insert(config.configurations, 1, {
			name = "Cpptools: Launch this file",
			type = "cppdbg",
			request = "launch",
			program = function()
				-- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				return vim.fn.expand("%:p:r") .. (vim.fn.has("win32") > 0 and ".exe" or ".out")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
		})
		require("mason-nvim-dap").default_setup(config)
	end,
	-- dart = function(config)
	-- 	local flutter_path = function()
	-- 		return os.getenv("HOME") .. "fvm/default"
	-- 	end

	-- 	config.adapters = {
	-- 		type = "executable",
	-- 		command = "dart",
	-- 		args = { "debug_adapter" },
	-- 	}
	-- 	config.configurations = {}
	-- 	table.insert(config.configurations, 1, {
	-- 		type = "dart",
	-- 		request = "launch",
	-- 		name = "Launch dart project",
	-- 		dartSdkPath = flutter_path() .. "/bin/cache/dart-sdk/bin/dart",
	-- 		flutterSdkPath = flutter_path() .. "/bin/flutter",
	-- 		program = "${workspaceFolder}/lib/main.dart",
	-- 		cwd = "${workspaceFolder}",
	-- 	})
	-- 	table.insert(config.configurations, 1, {
	-- 		type = "dart",
	-- 		request = "launch",
	-- 		name = "Launch dart single file",
	-- 		dartSdkPath = flutter_path() .. "/bin/cache/dart-sdk/bin/dart",
	-- 		flutterSdkPath = flutter_path() .. "/bin/flutter",
	-- 		program = vim.fn.expand("%:p"),
	-- 		cwd = "${workspaceFolder}",
	-- 	})
	-- 	table.insert(config.configurations, 1, {
	-- 		type = "flutter",
	-- 		request = "launch",
	-- 		name = "Launch flutter",
	-- 		dartSdkPath = flutter_path() .. "/bin/cache/dart-sdk/bin/dart",
	-- 		flutterSdkPath = flutter_path() .. "/bin/flutter",
	-- 		program = "${workspaceFolder}/lib/main.dart",
	-- 		cwd = "${workspaceFolder}",
	-- 	})
	-- 	require("mason-nvim-dap").default_setup(config)
	-- end,
	-- flutter = function(config)
	-- 	config.adapters = {
	--          name = "flutter",
	-- 		type = "executable",
	-- 		command = "flutter",
	-- 		args = { "debug_adapter" },
	-- 	}
	-- 	require("mason-nvim-dap").default_setup(config)
	-- end,

	-- old config
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
}

return debugger_config
