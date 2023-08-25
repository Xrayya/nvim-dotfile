local indent_blankline = {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup({
			buftype_exclude = { "terminal", "nofile" },
			filetype_exclude = {
				"alpha",
				"NvimTree",
				"help",
			},
			space_char_blankline = " ",
			show_current_context = true,
			indent_blankline_use_treesitter = true,
		})
	end,
}

return indent_blankline
