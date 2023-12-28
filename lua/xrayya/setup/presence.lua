local presence = {
	"andweeb/presence.nvim",
	config = function()
		require("presence").setup({
			main_image = "file",
			neovim_text_image = "Insane Text Editor",
			show_time = true,
		})
	end,
}

return presence
