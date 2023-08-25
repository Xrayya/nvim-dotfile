local colorschemes = {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "moon",
				light_style = "day",
				transparent = true,
			})

			vim.cmd.colorscheme("tokyonight-moon")
		end,
	},
}

return colorschemes
