local alpha = NOTIF_REQ("alpha", "alpha-config", "error")
if alpha == nil then
  return {}
end

local ui = require("icons").ui

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
  dashboard.button("f", ui.FindFile .. "  Find file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("e", ui.NewFile .. "  New file", "<cmd>ene <BAR> startinsert<CR>"),
  dashboard.button("p", ui.Project .. "  Find project", "<cmd>Telescope projects<CR>"),
  dashboard.button("r", ui.Clock1 .. "  Recently used files", "<cmd>Telescope oldfiles<CR>"),
  dashboard.button("l", ui.Clock2 .. "  Load last session", "<cmd>SessionManager load_current_dir_session<CR>"),
  dashboard.button("t", ui.Letter .. "  Find text", "<cmd>Telescope live_grep<CR>"),
  dashboard.button(
    "c",
    ui.Gear .. "  Browse nvim config file",
    "<cmd>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<CR>"
  ),
  -- dashboard.button("P", "  Configure Plugins", "<cmd>e " .. vim.fn.stdpath("config") .. "/lua/plugins.lua<CR>"),
  dashboard.button("S", ui.Refresh .. "  Sync Plugins", "<cmd>PackerSync<CR>"),
  dashboard.button("Q", ui.Close .. "  Quit Neovim", "<cmd>qa<CR>"),
}

-- local function footer()
--   local total_plugins = #vim.tbl_keys(packer_plugins)
--   local datetime = os.date(ui.Calendar .. " %d-%m-%Y " .. ui.Clock3 .. " %H:%M:%S")
--   return ui.Socket .. " " .. total_plugins .. " plugins " .. datetime
-- end

-- dashboard.section.footer.val = footer()
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
