local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

vim.cmd([[Lazy load which-key.nvim]])
require("setup.whichkey")

require("which-key").register({
	C = {
		name = "C++",
		c = {
			":!g++ -fdiagnostics-color=always -g "
				.. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
				.. " -o "
				.. vim.fn.fnamemodify(vim.fn.getcwd(), ":r")
				.. "<cr><cmd>lua vim.notify('Done Compiling')<cr>",
			"Compile",
		},
	},
	{
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	},
})
