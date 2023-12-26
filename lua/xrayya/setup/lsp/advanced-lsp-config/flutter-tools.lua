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

		vim.cmd("DapSetupDebugging")
	end,
}

return flutter_tools
