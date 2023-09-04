local session_manager = {
	"olimorris/persisted.nvim",
	config = function()
		require("persisted").setup({
			silent = false,
			use_git_branch = true,
			autosave = true,
			telescope = {
				reset_prompt_after_deletion = true,
			},
		})
	end,
}

return session_manager
