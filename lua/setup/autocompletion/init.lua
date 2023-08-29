local autocompletion = {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			-- luasnip.filetype_extend("javascript", { "javascriptreact" })
			luasnip.filetype_extend("php", { "html" })

			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("i", "<M-l>", "<cmd>lua require('luasnip').jump(1)<cr>", opts)
			map("i", "<M-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
			map("s", "<M-l>", "<cmd>lua require('luasnip').jump(1)<cr>", opts)
			map("s", "<M-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
			map("i", "<M-L>", "<cmd>lua require('luasnip').change_choice(1)<cr>", opts)
			map("i", "<M-H>", "<cmd>lua require('luasnip').change_choice(-1)<cr>", opts)
			map("s", "<M-L>", "<cmd>lua require('luasnip').change_choice(1)<cr>", opts)
			map("s", "<M-H>", "<cmd>lua require('luasnip').change_choice(-1)<cr>", opts)
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"windwp/nvim-autopairs",
			{
				"tzachar/cmp-tabnine",
				build = "powershell ./install.ps1",
			},
		},
		config = function()
			vim.g.completeopt = "menu,menuone,noselect"

			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.scroll_docs(-1),
					["<C-k>"] = cmp.mapping.scroll_docs(1),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = function(fallback)
						if
							not cmp.visible()
							or not cmp.get_selected_entry()
							or cmp.get_selected_entry().source.name == "nvim_lsp_signature_help"
						then
							fallback()
						else
							cmp.confirm({
								behavior = cmp.ConfirmBehavior.Replace,
								select = false,
							})
						end
					end,
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif has_words_before() then
							fallback()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "cmp_tabnine" },
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- integration with cmp-autopairs
			cmp.event:on(
				"confirm_done",
				require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } })
			)
		end,
	},
}

return autocompletion
