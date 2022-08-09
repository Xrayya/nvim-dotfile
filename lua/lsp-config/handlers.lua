local M = {}

local diagnostic_signs = require("icons").diagnostics

-- if you put this 9 lines below inside on_attach, then you will lose some html lsp
-- capabilities (and maybe other lsp too)
--
-- if you put it outside on_attach it will show  several two same snippets in jdtls,
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp_nvim_lsp = NOTIF_REQ("cmp_nvim_lsp", "lsp-config.handlers", "error")
if cmp_nvim_lsp ~= nil then
  M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
end

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = diagnostic_signs.Error },
    { name = "DiagnosticSignWarn", text = diagnostic_signs.Warning },
    { name = "DiagnosticSignHint", text = diagnostic_signs.Hint },
    { name = "DiagnosticSignInfo", text = diagnostic_signs.Information },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      max_width = math.floor(vim.o.columns * 0.5),
      max_height = 5,
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    max_width = math.floor(vim.o.columns * 0.5),
    max_height = 20,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    max_width = math.floor(vim.o.columns * 0.5),
    max_height = 20,
  })
end

function M.lsp_highlight_document(client)
  local illuminate =
    NOTIF_REQ("illuminate", "lsp-config.handlers (func lsp_highlight_document)", "error")
  if illuminate == nil then
    return
  end

  illuminate.on_attach(client)
end

function M.attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local navic = NOTIF_REQ("nvim-navic", "lsp-config.handlers (func attach_navic)", "error")
  if navic == nil then
    return
  end

  navic.attach(client, bufnr)
end

-- -- local function lsp_keymaps(bufnr)
-- --   local opts = { noremap = true, silent = true }
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- --   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- --   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- --   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
-- --   vim.api.nvim_buf_set_keymap(
-- --     bufnr,
-- --     "n",
-- --     "gl",
-- --     '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
-- --     opts
-- --   )
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
-- --   vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- --   vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
-- -- end

M.on_attach = function(client, bufnr)
  -- lsp_keymaps(bufnr)
  M.attach_navic(client, bufnr)
  M.lsp_highlight_document(client)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

return M
