-- LSP config (the mappings used in the default file don't quite work right)
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', 'gd',       'lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD',       'lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gr',       'lua vim.lsp.buf.references()<CR>', opts)
map('n', 'gi',       'lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'K',        'lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<C-S-k>',  'lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<C-n>',    'lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<C-p>',    'lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

-- Nvim-lsp-installer config
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
lsp_installer.on_server_ready(function (server) server:setup {} end)

-- Rooter
vim.g.rooter_patterns = {'.git'}
