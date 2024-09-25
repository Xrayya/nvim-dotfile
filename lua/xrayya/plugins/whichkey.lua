local whichkey = {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    local icons = LOAD_UTIL("icons")

    local whichkey = require("which-key")
    whichkey.setup({
      win = {
        border = "rounded",
      },
      layout = {
        align = "center",
      },
    })

    whichkey.add({
      mode = "n",
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffer explorer" },
      {
        { "<leader>d", group = "Debug" },
        { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
        {
          "<leader>dB",
          '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>',
          desc = "Set conditional breakpoint",
        },
        { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Run/Continue debug session" },
        { "<leader>de", '<cmd>lua require("dapui").eval()<cr>', desc = "Evaluate expression" },
        { "<leader>df", '<cmd>lua require("dapui").float_element()<cr>', desc = "Open floating window" },
        { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step into" },
        {
          { "<leader>dl", group = "Set Layout" },
          { "<leader>dlc", "<cmd>DapSetupRunningConsole<cr>", desc = "Running Console" },
          { "<leader>dlC", "<cmd>DapSetupDebuggingConsole<cr>", desc = "Debugging Console" },
          { "<leader>dld", "<cmd>DapSetupDebugging<cr>", desc = "Debugging" },
          { "<leader>dlr", "<cmd>DapSetupRunning<cr>", desc = "Running" },
        },
        { "<leader>dL", "<cmd>DapShowLog<cr>", desc = "Show log" },
        { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step over" },
        { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Step out" },
        { "<leader>dr", "<cmd>DapToggleRepl<cr>", desc = "Toggle repl" },
        { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate" },
        { "<leader>du", '<cmd>lua require("dapui").toggle()<cr>', desc = "UI open/close toggele" },
      },
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
      {
        { "<leader>f", group = "Find" },
        { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>fH", "<cmd>Telescope command_history<cr>", desc = "Command history" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "File" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymapts" },
        { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
        { "<leader>fQ", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix history" },
        { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>", desc = "Search in current buffer" },
      },
      {
        { "<leader>g", group = "Git" },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
        { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
        { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
        { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
        { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
        { "<leader>gl", '<cmd>lua require"gitsigns".blame_line()<CR>', desc = "Line Blame" },
        { "<leader>gt", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
        { "<leader>gp", '<cmd>lua require"gitsigns".preview_hunk()<CR>', desc = "Preview hunk" },
        { "<leader>gr", '<cmd>lua require"gitsigns".reset_hunk()<CR>', desc = "Reset hunk" },
        { "<leader>gR", '<cmd>lua require"gitsigns".reset_buffer()<CR>', desc = "Reset buffer" },
        { "<leader>gs", '<cmd>lua require"gitsigns".stage_hunk()<CR>', desc = "Stage hunk" },
        { "<leader>gu", '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', desc = "Undo stage hunk" },
        { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
      },
      {
        "<leader>h",
        "<cmd>set hlsearch!<cr>",
        desc = "Hightlight text toggle",
      },
      {
        { "<leader>l", group = "LSP", icon = icons.ui.LSP },
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
        { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition(s)" },
        { "<leader>lD", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Go to type definition(s)" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format({timeout_ms=2000})<CR>", desc = "Format current buffer" },
        { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
        { "<leader>lH", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signture help" },
        { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto implementation(s)" },
        { "<leader>lI", "<cmd>LspInlayHintsToggle<cr>", desc = "Toggle LSP inlay hints" },
        { "<leader>ll", "<cmd>Telescope diagnostics<cr>", desc = "Open diagnostic list" },
        { "<leader>lL", "<cmd>LspLineToggle<cr>", desc = "Toggle LSP line" },
        { "<leader>lo", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Open diagnostic under cursor" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
        { "<leader>lR", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      },
      { "<leader>L", group = "LaTeX", icon = icons.ui.Latex },
      {
        "<leader>o",
        "<cmd>AerialToggle<cr>",
        desc = "Toggle Symbols Outline",
      },
      { "<leader>r", "<cmd>Triptych<cr>", desc = "Toggle Triptych" },
      { "<leader>w", "<cmd>write<cr>", desc = "Save" },
      { "<leader>W", "<cmd>lua vim.lsp.buf.format({timeout_ms=2000})<CR><cmd>write<cr>", desc = "Write and format" },
      { "<leader>,", "<cmd>set wrap<cr>", desc = "Set wrap" },
      {
        "[h",
        '<cmd>lua require"gitsigns.actions".prev_hunk()<CR>',
        desc = "Jump to previous hunk",
      },
      { "]h", '<cmd>lua require"gitsigns.actions".next_hunk()<CR>', desc = "Jump to next hunk" },
    })
  end,
}

return whichkey
