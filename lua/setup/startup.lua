local startup = {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		math.randomseed(os.time())

		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			[[                                                 ]],
			[[                                                 ]],
			[[                                                 ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "x" .. "  Find file", "<cmd>Telescope find_files<cr>"),
			dashboard.button("p", "x" .. "  Find project", "<cmd>Telescope projects<cr>"),
			dashboard.button("r", "x" .. "  Recently used files", "<cmd>Telescope oldfiles<cr>"),
			dashboard.button("l", "x" .. "  Load last session", "<cmd>SessionLoad<cr>"),
			dashboard.button("t", "x" .. "  Find text", "<cmd>Telescope live_grep<cr>"),
			dashboard.button(
				"c",
				"x" .. "  Browse nvim config file",
				"<cmd>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<cr>"
			),
			dashboard.button("S", "x" .. "  Sync Plugins", "<cmd><cr>"),
			dashboard.button("Q", "x" .. "  Quit Neovim", "<cmd>qa<cr>"),
		}

		local function footer()
			local total_plugins = "x" -- #vim.tbl_keys(packer_plugins)
			local datetime = os.date("x" .. " %d-%m-%Y " .. "x" .. " %H:%M:%S")
			return "x" .. " " .. total_plugins .. " plugins " .. datetime
		end

		dashboard.section.footer.val = footer()
		-- dashboard.section.header.opts.hl = "Include"
		-- dashboard.section.buttons.opts.hl = "Keyword"

		alpha.setup(dashboard.opts)
	end,
}

return startup
