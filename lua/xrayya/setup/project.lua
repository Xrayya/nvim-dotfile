local project = {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			detection_methods = { "lsp", "pattern" },
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
			show_hidden = true,
		})
	end,
}

return project
