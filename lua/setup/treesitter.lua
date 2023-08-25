local treesitter = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"p00f/nvim-ts-rainbow",
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"RRethy/nvim-treesitter-endwise",
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({
					check_ts = true,
				})
			end,
		},
	},
	config = function()
		require("nvim-treesitter.install").compilers = { "gcc", "clang" }

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"comment",
				"cpp",
				"css",
				"dart",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"php",
				"python",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
			autotag = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
			},
			endwise = {
				enable = true,
			},
		})
	end,
}

return treesitter
