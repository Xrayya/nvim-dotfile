local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp-config.lsp-installer")
require("lsp-config.handlers").setup()

--- Old config

-- -- Lspconfig icon sign
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

-- -- Nvim-lsp-installer config
-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.settings({
--     ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗"
--         }
--     }
-- })

-- -- Default servers config
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}

--     -- if server.name == "jsonls" then
--     --   local jsonls_opts = require("user.lsp.settings.jsonls")
--     --   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--     -- end

--     if server.name == "sumneko_lua" then
--       local sumneko_opts = require("lsp-config.costume-lsp-settings.sumneko_lua")
--       opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--     end
--     server:setup(opts)
-- end)
