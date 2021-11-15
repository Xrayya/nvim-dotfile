-- Setup settings
require('plugins')
require('settings')
require('keymappings')

-- LSP
require('lsp.lsp-config')
require('lsp.cmp-config')
require('lsp.commentary-config')

-- Plug-config
vim.cmd('source ~/AppData/Local/nvim/plug-config/Themes.vim')
--vim.cmd('source ~/AppData/Local/nvim/plug-config/vim-rainbow.vim')
--vim.cmd('source ~/AppData/Local/nvim/plug-config/start-screen.vim')
require('treesitter')
require('tree')
--require('galaxyline.eviline')
require('buffer')
require('telescope')

--require'colorizer'.setup()
