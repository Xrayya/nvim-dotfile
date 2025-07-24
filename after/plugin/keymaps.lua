local icons = Xray.config.icons

local whichkey = require("which-key")

local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

local dapui = require("dapui")

local gitsigns = require("gitsigns")
local gitsigns_action = require("gitsigns.actions")

local lsp_buf = vim.lsp.buf

whichkey.add({
  mode = "n",
  {
    "<leader>b",
    telescope_builtin.buffers,
    desc = "Buffer explorer",
  },
  {
    { "<leader>d", group = "Debug" },
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Set conditional breakpoint",
    },
    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Run/Continue debug session" },
    {
      "<leader>de",
      dapui.eval,
      desc = "Evaluate expression",
    },
    {
      "<leader>df",
      dapui.float_element,
      desc = "Open floating window",
    },
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
    {
      "<leader>du",
      dapui.toggle,
      desc = "UI open/close toggele",
    },
  },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
  {
    { "<leader>f", group = "Find" },
    {
      "<leader>fc",
      telescope_builtin.commands,
      desc = "Commands",
    },
    {
      "<leader>fH",
      telescope_builtin.command_history,
      desc = "Command history",
    },
    {
      "<leader>ff",
      telescope_builtin.find_files,
      desc = "File",
    },
    {
      "<leader>fg",
      telescope_builtin.live_grep,
      desc = "Grep",
    },
    {
      "<leader>fh",
      telescope_builtin.help_tags,
      desc = "Help",
    },
    {
      "<leader>fk",
      telescope_builtin.keymaps,
      desc = "Keymapts",
    },
    {
      "<leader>fq",
      telescope_builtin.quickfix,
      desc = "Quickfix",
    },
    {
      "<leader>fQ",
      telescope_builtin.quickfixhistory,
      desc = "Quickfix history",
    },
    {
      "<leader>fs",
      function()
        telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_ivy())
      end,
      desc = "Search in current buffer",
    },
  },
  {
    { "<leader>g", group = "Git" },
    {
      "<leader>gb",
      telescope_builtin.git_branches,
      desc = "Checkout branch",
    },
    {
      "<leader>gc",
      telescope_builtin.git_commits,
      desc = "Checkout commit",
    },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
    { "<leader>gl", gitsigns.blame_line, desc = "Line Blame" },
    { "<leader>gt", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
    { "<leader>gp", gitsigns.preview_hunk, desc = "Preview hunk" },
    { "<leader>gr", gitsigns.reset_hunk, desc = "Reset hunk" },
    { "<leader>gR", gitsigns.reset_buffer, desc = "Reset buffer" },
    { "<leader>gs", gitsigns.stage_hunk, desc = "Stage/unstage hunk" },
    {
      "<leader>go",
      telescope_builtin.git_status,
      desc = "Open changed file",
    },
  },
  {
    "<leader>h",
    "<cmd>set hlsearch!<cr>",
    desc = "Hightlight text toggle",
  },
  {
    { "<leader>l", group = "LSP", icon = icons.ui.LSP },
    -- {
    --   "<leader>la",
    --   lsp_buf.code_action,
    --   desc = "Code Action",
    -- },
    { "<leader>ld", telescope_builtin.lsp_definitions, desc = "Go to definition(s)" },
    { "<leader>lD", telescope_builtin.lsp_type_definitions, desc = "Go to type definition(s)" },
    {
      "<leader>lf",
      function()
        lsp_buf.format({ timeout_ms = 2000 })
      end,
      desc = "Format current buffer",
    },
    -- {
    --   "<leader>lh",
    --   lsp_buf.hover,
    --   desc = "Hover",
    -- },
    -- {
    --   "<leader>lH",
    --   lsp_buf.signature_help,
    --   desc = "Signture help",
    -- },
    { "<leader>li", telescope_builtin.lsp_implementations, desc = "Goto implementation(s)" },
    { "<leader>lI", "<cmd>LspInlayHintsToggle<cr>", desc = "Toggle LSP inlay hints" },
    { "<leader>ll", telescope_builtin.diagnostics, desc = "Open diagnostic list" },
    { "<leader>lL", "<cmd>DiagnosticVirtualLineToggle<cr>", desc = "Toggle Diagnostic Virtual Line" },
    -- { "<leader>lo", vim.diagnostic.open_float,             desc = "Open diagnostic under cursor" },
    -- {
    --   "<leader>lr",
    --   lsp_buf.rename,
    --   desc = "Rename",
    -- },
    { "<leader>lR", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "<leader>lT", "<cmd>DiagnosticVirtualTextToggle<cr>", desc = "Toggle Diagnostic Virtual Text" },
  },
  { "<leader>L", group = "LaTeX", icon = icons.ui.Latex },
  {
    "<leader>n",
    "<cmd>NoiceAll<cr>",
    desc = "Open notifcation center",
  },
  {
    "<leader>o",
    "<cmd>AerialToggle<cr>",
    desc = "Toggle Symbols Outline",
  },
  { "<leader>r", "<cmd>Triptych<cr>", desc = "Toggle Triptych" },
  { "<leader>w", "<cmd>write<cr>", desc = "Save" },
  {
    "<leader>W",
    function()
      vim.lsp.buf.format({ timeout_ms = 2000 })
      vim.cmd("write")
    end,
    desc = "Write and format",
  },
  { "<leader>T", group = "Markdown Todo", icon = icons.ui.TODO },
  {
    "<leader>,",
    function()
      if vim.g.wraptext then
        vim.g.wraptext = false
        vim.opt.wrap = false
      else
        vim.g.wraptext = true
        vim.o.wrap = true
      end
    end,
    desc = "Toggle wrap",
  },
  {
    "[h",
    function()
      gitsigns_action.nav_hunk("prev", {
        preview = true,
        target = "all",
      })
    end,
    desc = "Jump to previous hunk",
  },
  {
    "]h",
    function()
      gitsigns_action.nav_hunk("next", {
        preview = true,
        target = "all",
      })
    end,
    desc = "Jump to next hunk",
  },
})
