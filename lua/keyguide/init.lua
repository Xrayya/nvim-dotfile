local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    f = {
      name = "+File",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      n = { "<cmd>enew<cr>", "New File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    },
    -- h = { "<cmd>set hlsearch!", "Hightlight Text" },
    j = {
      name = "+Jump (HoP)",
      c = { "<cmd>HopChar1<cr>", "One char mode" },
      C = { "<cmd>HopChar2<cr>", "Two char mode" },
      p = { "<cmd>HopPattern<cr>", "Pattern mode"},
      w = { "<cmd>HopWord<cr>", "Word mode" },
    },
    l = {
      name = "+LSP",
      c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action"},
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover"},
      l = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Line diagnostics" },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Referece" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signture_help"},
      t = {
        name = "+Trouble list",
        -- a = { "<cmd>lua require('diaglist').open_all_diagnostics()<cr>", "All buffer" },
        -- b = { "<cmd>lua require('diaglist').open_buffer_diagnostics()<cr>", "Current buffer" },
        b = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Current buffer diagnostics" },
        w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Current workspace diagnostics" },
        d = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definition" },
        t = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "Type definition"},
      },
    },
  },
})
