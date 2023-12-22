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
			vim.api.nvim_set_hl(0, "LineNr", { link = "Number" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { link = "LineNr" })
		end,
	},
}

return colorschemes
