local wk = require("functions").notifreq("which-key", "whichkey-config", "error")
if wk == nil then
  return
end

wk.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<Plug>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

local n_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local br_opts = {
  mode = "n", -- NORMAL mode
  prefix = "]",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local bl_opts = {
  mode = "n", -- NORMAL mode
  prefix = "[",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local n_mappings = {
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
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  f = {
    name = "Find",
    b = { "<cmd>Telescope buffers<cr>", "Opened buffer" },
    B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    f = { "<cmd>Telescope find_files<cr>", "File" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Browse :help" },
    k = { "<cmd>Telescope keymaps<cr>", "Browse keymaps" },
    n = { "<cmd>enew<cr>", "New File" },
    p = { "<cmd>Telescope projects<cr>", "Open project manajer" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent file" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Search in current buffer" },
    S = { "<cmd>Telescope sessions<cr>", "Last Seasons" },
    t = { "<cmd>Telescope help_tags<cr>", "Tags" },
  },
  h = { "<cmd>set hlsearch!<cr>", "Hightlight text toggle" },
  i = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Inlayhints toggle" },
  I = { "<cmd>IndentBlacklineToggle<cr>", "Indentation line toggle" },
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
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
    A = { "<cmd>LspStop<CR><cmd>LspStart<CR>", "Activate/reactivate LSP" },
    -- d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    -- D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
    d = { "<cmd>Telescope lsp_definitions<CR>", "Go to definition" },
    D = { "<cmd>Telescope lsp_type_definition<CR>", "Go to type definition" },
    f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format current buffer" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    H = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signture help" },
    i = { "<cmd>LspInfo<cr>", "LSP info" },
    l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostics" },
    p = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Preview definition" },
    P = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Preview type definition" },
    r = { "<cmd>lua require('renamer').rename()<CR>", "Rename" },
    R = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Referece" },
    -- s = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document symbols" },
    -- S = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace symbols" },
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
    S = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace symbols" },
    t = {
      name = "+Trouble list",
      b = { "<cmd>TroubleToggle document_diagnostics<cr>", "Current buffer diagnostics" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Current workspace diagnostics" },
      d = { "<cmd>TroubleToggle definitions<cr>", "Definition" },
      t = { "<cmd>TroubleToggle type_definitions<cr>", "Type definition" },
    },
  },
  L = { '<cmd>lua require("lsp-lines").toggle()<cr>', "Toggle lsp-line" },
  m = { "<cmd>Mason<cr>", "Open Mason" },
  p = {
    name = "Plugin action",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    e = { "<cmd>e " .. vim.fn.stdpath("config") .. "/lua/plugins.lua<cr>", "Edit plugins" },
    C = { "<cmd>PackerClean<cr>", "Clean" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
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
    c = { "<cmd>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<CR>", "Browse nvim config files" },
    C = {
      "<cmd>e " .. vim.fn.stdpath("config") .. "/my-utils/CMakeLists-template.txt<cr>",
      "CMakeLists.txt template",
    },
  },
  w = { ":w<cr>", "Write (save)" },
  W = { "<cmd>lua vim.lsp.buf.format()<CR><cmd>write<cr>", "Write and format" },
}

local br_mappings = {
  d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Jump to previous diagnostics" },
  h = { '<cmd>lua require"gitsigns.actions".prev_hunk()<CR>', "Jump to previous hunk" },
}

local bl_mappings = {
  d = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Jump to next diagnostics" },
  h = { '<cmd>lua require"gitsigns.actions".next_hunk()<CR>', "Jump to next hunk" },
}

wk.register(n_mappings, n_opts)
wk.register(br_mappings, br_opts)
wk.register(bl_mappings, bl_opts)
