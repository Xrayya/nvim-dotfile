local telescope = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			local themes = require("telescope.themes")
			local actions = require("telescope.actions")

			require("telescope").setup({
				pickers = {
					buffers = {
						theme = "dropdown",
						previewer = false,
						initial_mode = "normal",
						mappings = {
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
					},
					help_tags = {
						layout_config = {
							preview_width = 0.6,
						},
					},
					lsp_document_symbols = {
						theme = "ivy",
						layout_config = {
							height = 0.4,
						},
					},
					lsp_workspace_symbols = {
						theme = "ivy",
						layout_config = {
							height = 0.4,
						},
					},
					lsp_definitions = {
						theme = "ivy",
						layout_config = {
							height = 0.4,
						},
					},
					lsp_type_definitions = {
						theme = "ivy",
						layout_config = {
							height = 0.4,
						},
					},
				},
				defaults = {
					path_display = { "smart" },
					file_ignore_patterns = { ".git/", "node_modules" },
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
					mappings = {
						i = {
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
							["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
							["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
						},
						n = {
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
							["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
							["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}
return telescope