-- Setup settings
require('plugins')
require('settings')
require('keymappings')

-- LSP
require('lsp.lsp-config')
require('lsp.cmp-config')
--require('lsp.diaglist-config')
require('lsp.commentary-config')
require('lsp.indenting')
require('lsp.saga')

-- Plug-config
vim.cmd('source ~/AppData/Local/nvim/vim-config/themes.vim')
vim.cmd('source ~/AppData/Local/nvim/vim-config/nvide.vim')
require('treesitter')
require('tree')
require('gitsigns-config')
--require('galaxyline.eviline')
require('buffer')
-- require('luastatusline.my-costume')
require('telescope')
require('dashboard')
require('terminal')
