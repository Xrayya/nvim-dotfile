local whichkey = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local whichkey = require("which-key")
    whichkey.setup({
      window = {
        border = "rounded",
      },
      layout = {
        align = "center",
      },
    })

    whichkey.register({
      b = { "<cmd>Telescope buffers<cr>", "Buffer explorer" },
      d = {
        name = "Debug",
        b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle breakpoint" },
        B = {
          '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>',
          "Set conditional breakpoint",
        },
        c = { "<cmd>DapContinue<cr>", "Run/Continue debug session" },
        e = { '<cmd>lua require("dapui").eval()<cr>', "Evaluate expression" },
        f = { '<cmd>lua require("dapui").float_element()<cr>', "Open floating window" },
        i = { "<cmd>DapStepInto<cr>", "Step into" },
        l = { "<cmd>DapShowLog<cr>", "Show log" },
        o = { "<cmd>DapStepOver<cr>", "Step over" },
        O = { "<cmd>DapStepOut<cr>", "Step out" },
        r = { "<cmd>DapToggleRepl<cr>", "Toggle repl" },
        t = { "<cmd>DapTerminate<cr>", "Terminate" },
        u = { '<cmd>lua require("dapui").toggle()<cr>', "UI open/close toggele" },
      },
      e = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
      f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "File" },
        g = { "<cmd>Telescope live_grep<cr>", "Grep" },
        h = { "<cmd>Telescope help_tags<cr>", "help" },
        s = { "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Search in current buffer" },
      },
      g = {
        name = "Git",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { '<cmd>lua require"gitsigns".blame_line()<CR>', "Line Blame" },
        p = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk" },
        r = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk" },
        R = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', "Reset buffer" },
        s = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk" },
        u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Undo stage hunk" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      },
      h = { "<cmd>set hlsearch!<cr>", "Hightlight text toggle" },
      l = {
        name = "LSP",
        a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
        A = { "<cmd>LspRestart<CR>", "Activate/reactivate LSP" },
        d = { "<cmd>Lspsaga goto_definitions<cr>", "Go to definition" },
        D = { "<cmd>Lspsaga goto_type_definitions<cr>", "Go to type definition" },
        f = { "<cmd>lua vim.lsp.buf.format({timeout_ms=2000})<CR>", "Format current buffer" },
        h = { "<cmd>Lspsaga hover_doc<cr>", "Hover" },
        H = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signture help" },
        i = { "<cmd>LspInfo<cr>", "Lsp info" },
        o = { "<cmd>Lspsaga outline<cr>", "Outline" },
        p = { "<cmd>Lspsaga peek_definition<cr>", "Preview definition" },
        P = { "<cmd>Lspsaga peek_type_definition<cr>", "Preview type definition" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
      },
      w = { "<cmd>write<cr>", "Save" },
      W = { "<cmd>lua vim.lsp.buf.format({timeout_ms=2000})<CR><cmd>write<cr>", "Write and format" },
      [","] = { "<cmd>set wrap<cr>", "Set wrap" },
    }, {
      mode = "n",
      prefix = "<leader>",
    })

    whichkey.register({
      d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Jump to previous diagnostics" },
      h = { '<cmd>lua require"gitsigns.actions".prev_hunk()<CR>', "Jump to previous hunk" },
    }, {
      mode = "n",
      prefix = "[",
    })

    whichkey.register({
      d = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Jump to next diagnostics" },
      h = { '<cmd>lua require"gitsigns.actions".next_hunk()<CR>', "Jump to next hunk" },
    }, {
      mode = "n",
      prefix = "]",
    })
  end,
}

return whichkey