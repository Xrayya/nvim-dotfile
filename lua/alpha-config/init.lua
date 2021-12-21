local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
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
	dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
	dashboard.button("e", "  New file", "<cmd>ene <BAR> startinsert<CR>"),
	dashboard.button("p", "  Find project", "<cmd>Telescope projects<CR>"),
	dashboard.button("r", "  Recently used files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("s", "  Open session", "<cmd>Telescope sessions<CR>"),
	dashboard.button("t", "  Find text", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("c", "  Configuration", "<cmd>e " .. vim.fn.stdpath('config') .. "/init.lua<CR>"),
	dashboard.button("P", "  Configure Plugins", "<cmd>e " .. vim.fn.stdpath('config') .. "/lua/plugins.lua<CR>"),
	dashboard.button("S", "  Sync Plugins", "<cmd>PackerSync<CR>"),
	dashboard.button("q", "  Quit Neovim", "<cmd>qa<CR>"),
}

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date("%d-%m-%Y  %H:%M:%S")
  return total_plugins .. " plugins  " .. datetime
end

dashboard.section.footer.val = footer()
-- dashboard.section.footer.opts.hl = "Constant"
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

-- hide tabline on startup screen
-- vim.cmd [[
-- augroup alpha_tabline
--   au!
--   au FileType alpha set showtabline=0 | au BufUnload <buffer> set showtabline=2
-- augroup END
-- ]]

alpha.setup(dashboard.opts)
