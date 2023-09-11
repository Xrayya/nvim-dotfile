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

local import_setup = function(module)
	return require("xrayya.setup." .. module)
end

require("lazy").setup({
	"folke/lazy.nvim",
	import_setup("colorschemes"),
	import_setup("explorer"),
	import_setup("telescope"),
	import_setup("mason"),
	import_setup("lsp"),
	import_setup("autocompletion"),
	import_setup("whichkey"),
	import_setup("treesitter"),
	import_setup("commentary"),
	import_setup("notification"),
  import_setup("project"),
	import_setup("colorizer"),
	import_setup("indent-blankline"),
	import_setup("navigation"),
	import_setup("git"),
	import_setup("illuminate"),
	import_setup("startup"),
	import_setup("statusline"),
	import_setup("debugger"),
	import_setup("presence"),
	import_setup("session-manager"),
})
