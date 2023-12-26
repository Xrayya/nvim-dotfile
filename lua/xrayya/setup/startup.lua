local startup = {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
    local ui = LOAD_UTIL("icons").ui
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
			dashboard.button("f", ui.FindFile .. "  Find file", "<cmd>Telescope find_files<cr>"),
			-- dashboard.button("p", ui.Project .. "  Find project", "<cmd>Telescope projects<cr>"),
			dashboard.button("r", ui.RecentFile .. "  Recently used files", "<cmd>Telescope oldfiles<cr>"),
			dashboard.button("l", ui.Clock2 .. "  Load last session", "<cmd>SessionManager load_current_dir_session<cr>"),
			dashboard.button("t", ui.GrepString .. "  Find text", "<cmd>Telescope live_grep<cr>"),
			dashboard.button(
				"c",
				ui.Gear .. "  Browse nvim config file",
				"<cmd>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<cr>"
			),
			dashboard.button("M", ui.ToolBox .. "  Open Mason Home", "<cmd>Mason<cr>"),
			dashboard.button("P", ui.Socket .. "  Open Plugin Manager", "<cmd>Lazy<cr>"),
			dashboard.button("Q", ui.Out .. "  Quit Neovim", "<cmd>qa<cr>"),
		}

		local function footer()
			local total_plugins = #vim.tbl_keys(require("lazy").plugins())
			local datetime = os.date(ui.Calendar .. " %d-%m-%Y " .. ui.Clock1 .. " %H:%M:%S")
			return ui.Socket .. " " .. total_plugins .. " plugins " .. datetime
		end

		dashboard.section.footer.val = footer()
		-- dashboard.section.header.opts.hl = "Include"
		-- dashboard.section.buttons.opts.hl = "Keyword"

		alpha.setup(dashboard.opts)
	end,
}

return startup
