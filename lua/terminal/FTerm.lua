require'FTerm'.setup({
	-- Command to run inside the terminal. It could be a `string` or `table`
	-- cmd = os.getenv('pwsh'),

	-- Neovim's native window border. See `:h nvim_open_win` for more configuration options.
	border = 'light',

	-- Close the terminal as soon as shell/command exits.
	-- Disabling this will mimic the native terminal behaviour.
	auto_close = false,

	-- Highlight group for the terminal. See `:h winhl`
	hl = 'Normal',

	-- Transparency of the floating window. See `:h winblend`
	blend = 0,

	-- Object containing the terminal window dimensions.
	-- The value for each field should be between `0` and `1`
	dimensions = {
		height = 0.9, -- Height of the terminal window
		width = 0.9, -- Width of the terminal window
		x = 0.5, -- X axis of the terminal window
		y = 0.5, -- Y axis of the terminal window
	}
})

-- -- Initial keybindings
-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
-- map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

vim.cmd('command! FTermOpen lua require("FTerm").open()')
vim.cmd('command! FTermClose lua require("FTerm").close()')
vim.cmd('command! FTermExit lua require("FTerm").exit()')
vim.cmd('command! FTermToggle lua require("FTerm").toggle()')
