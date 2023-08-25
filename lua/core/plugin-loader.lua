-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local colorschemes = require("setup.colorschemes")
local explorer = require("setup.explorer")
local telescope = require("setup.telescope")
local mason = require("setup.mason")
local lsp = require("setup.lsp")
local autocompletion = require("setup.autocompletion")
local whichkey = require("setup.whichkey")
local treesitter = require("setup.treesitter")
local commentary = require("setup.commentary")
local notification = require("setup.notification")
local colorizer = require("setup.colorizer")
local indent_blankline = require("setup.indent-blankline")
local navigation = require("setup.navigation")
local git = require("setup.git")
local illuminate = require("setup.illuminate")
local startup = require("setup.startup")
local lualine = require("setup.lualine")
local debugger = require("setup.debugger")

require("lazy").setup({
	"folke/lazy.nvim",
	navigation,
	notification,
	startup,
	treesitter,
	indent_blankline,
	whichkey,
	autocompletion,
	commentary,
	colorschemes,
	explorer,
	telescope,
	git,
	mason,
	lsp,
	illuminate,
	lualine,
	colorizer,
  debugger,
})
