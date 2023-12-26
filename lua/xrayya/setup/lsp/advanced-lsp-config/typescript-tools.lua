local typescript_tools = {
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local opts = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			settings = {
				publish_diagnostic_on = "change",
				expose_as_code_action = "all",
				complete_function_calls = true,
			},
		}
		vim.tbl_deep_extend("force", opts, require("xrayya.setup.lsp.custom-lsp-config.tsserver"))

		require("typescript-tools").setup(opts)
	end,
}

return typescript_tools
