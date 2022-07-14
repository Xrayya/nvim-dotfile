local wk = require("which-key")

wk.setup({
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
})

wk.register({
  ["<leader>"] = {
    b = { "<cmd>JABSOpen<cr>", "Buffer Explorer" },
    c = {
      name = "Commentary",
      i = {
        name = "Increase (motion's enable)",
        c = { "<Plug>kommentary_motion_increase l", "Current line" },
      },
      d = {
        name = "Decrease (motion's enable)",
        c = { "<Plug>kommentary_motion_decrease l", "Current line" },
      },
    },
    C = { "<cmd>PickColor<cr>", "Pick Color" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    f = {
      name = "Find",
      B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      f = { "<cmd>Telescope find_files<cr>", "File" },
      g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
      n = { "<cmd>enew<cr>", "New File" },
      p = { "<cmd>Telescope projects<cr>", "Open project manajer" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent file" },
      s = { "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Search in current buffer" },
      S = { "<cmd>Telescope sessions<cr>", "Last Seasons" },
      t = { "<cmd>Telescope help_tags<cr>", "Tags" },
    },
    h = { "<cmd>set hlsearch!<cr>", "Hightlight text toggle" },
    i = { "<cmd>IndentBlacklineToggle<cr>", "Indentation line toggle" },
    j = {
      name = "Jump (HoP)",
      c = { "<cmd>HopChar1<cr>", "One char mode" },
      C = { "<cmd>HopChar2<cr>", "Two char mode" },
      p = { "<cmd>HopPattern<cr>", "Pattern mode" },
      w = { "<cmd>HopWord<cr>", "Word mode" },
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
      t = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Open terminal (lazygit)" },
      u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Undo stage hunk" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    },
    l = {
      name = "LSP",
      a = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code action" },
      A = { "<cmd>LspStop<CR><cmd>LspStart<CR>", "Activate/reactivate LSP" },
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      F = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "LSP Finder" },
      f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format current buffer(native LSP)" },
      h = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", "Hover" },
      i = { "<cmd>LspInfo<cr>", "LSP Info" },
      I = { "<cmd>LspInstallInfo<cr>", "LSP installer Info" },
      j = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", "Scroll down" },
      k = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", "Scroll up" },
      l = { "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", "Line diagnostics" },
      p = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Preview definition" },
      r = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename" },
      R = { "<cmd>lua vim.lsp.buf.references()<CR>", "Referece" },
      s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signture_help" },
      t = {
        name = "+Trouble list",
        b = { "<cmd>TroubleToggle document_diagnostics<cr>", "Current buffer diagnostics" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Current workspace diagnostics" },
        d = { "<cmd>TroubleToggle definitions<cr>", "Definition" },
        t = { "<cmd>TroubleToggle type_definitions<cr>", "Type definition" },
      },
    },
    p = {
      name = "Plugin action",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      e = { "<cmd>e " .. vim.fn.stdpath("config") .. "/lua/plugins.lua<cr>", "Edit (configure) plugins" },
      C = { "<cmd>PackerClean<cr>", "Clean" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
    },
    q = {
      name = "Quit",
      n = { "", "Are you sure (no)" },
      y = { "<cmd>q<cr>", "Are you sure? (yes)" },
    },
    Q = {
      name = "Quit (force)",
      n = { "", "Are you sure (no)" },
      y = { "<cmd>q!<cr>", "Are you sure? (yes)" },
    },
    s = { "<cmd>SymbolsOutline<cr>", "Open Symbols Outline" },
    t = {
      name = "Terminal",
      a = { "<cmd>lua _PWSH1_TOGGLE()<CR>", "H terminal 1" },
      b = { "<cmd>lua _PWSH2_TOGGLE()<CR>", "H terminal 2" },
      c = { "<cmd>lua _PWSH3_TOGGLE()<CR>", "H terminal 3" },
      f = { "<cmd>lua _F_PWSH1_TOGGLE()<cr>", "F terminal 1" },
      F = { "<cmd>lua _F_PWSH2_TOGGLE()<cr>", "F terminal 2" },
      n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Terminal (node)" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Terminal (python)" },
      v = { "<cmd>lua _V_PWSH1_TOGGLE()<cr>", "V terminal 1" },
      V = { "<cmd>lua _V_PWSH2_TOGGLE()<cr>", "V terminal 2" },
    },
    T = {
      name = "Task runner",
      s = { "<cmd>Telescope toggletasks spawn<cr>", "Spawn tasks" },
      S = { "<cmd>Telescope toggletasks select<cr>", "Select running tasks" },
      e = { "<cmd>Telescope toggletasks select<cr>", "Edit config files" },
    },
    u = {
      name = "Utilities",
      t = { "<cmd>e " .. vim.fn.stdpath("config") .. "/toggletasks.json<cr>", "toggletasks.json database" },
      C = {
        "<cmd>e " .. vim.fn.stdpath("config") .. "/my-utils/CMakeLists-template.txt<cr>",
        "CMakeLists.txt template",
      },
    },
    w = { ":w<cr>", "Write (save)" },
    -- W = { ":w<cr><cmd>FormatWrite<cr>", "Write and format" },
    W = { "<cmd>lua vim.lsp.buf.format()<CR><cmd>write<cr>", "Write and format" },
  },
  ["["] = {
    d = { "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", "Jump to previous diagnostics" },
    h = { '<cmd>lua require"gitsigns.actions".prev_hunk()<CR>', "Jump to previous hunk" },
  },
  ["]"] = {
    d = { "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", "Jump to next diagnostics" },
    h = { '<cmd>lua require"gitsigns.actions".next_hunk()<CR>', "Jump to next hunk" },
  },
})
