local explorer = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local icons = require("xrayya.utils.icons")

		require("nvim-tree").setup({
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			view = {
				width = 35,
			},
			renderer = {
				root_folder_label = ":t",
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = "before",
					glyphs = {
						default = icons.ui.File,
						symlink = icons.ui.Symlink,
						-- stylua : ignore
						folder = {
							arrow_open = icons.ui.ArrowOpen,
							arrow_closed = icons.ui.ArrowClosed,
							default = icons.documents.Folder,
							open = icons.documents.FolderOpen,
							empty = icons.documents.EmptyFolder,
							empty_open = icons.documents.EmptyFolderOpen,
							symlink = icons.documents.SymlinkFolder,
							symlink_open = icons.documents.SymlinkFolder,
						},
						git = {
							unstaged = icons.git.Mod,
							staged = icons.git.Staged,
							unmerged = icons.git.Unmerged,
							renamed = icons.git.Rename,
							untracked = icons.git.Untracked,
							deleted = icons.git.Remove,
							ignored = icons.git.Ignore,
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				icons = {
					hint = icons.diagnostics.Hint,
					info = icons.diagnostics.Information,
					warning = icons.diagnostics.Warning,
					error = icons.diagnostics.Error,
				},
			},
			git = {
				enable = true,
				ignore = false,
				show_on_dirs = true,
				timeout = 500,
			},
		})
	end,
}

return explorer
