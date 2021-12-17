local wk = require("which-key")

wk.setup{
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
}

-- Setup for toggleterm
local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function ()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end
local toggle_lazygit = function ()
  local lazy = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    start_in_insert = true,
    insert_mappings = true,
  })
  return lazy:toggle()
end
local toggle_pwsh = function ()
  local pwsh = Terminal:new({
    cmd = "pwsh",
    direction = "float",
    start_in_insert = true,
    insert_mappings = true,
  })
  return pwsh:toggle()
end

wk.register({
  ["<leader>"] = {
    c = {
      name = "Commentary",
      i = {
        name = "Increase (motion's enable)",
        c = { "<Plug>kommentary_motion_increase ", "Current line" },
      },
      d = {
        name = "Decrease (motion's enable)",
        c = { "<Plug>kommentary_motion_decrease ", "Current line" },
      },
    },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    f = {
      name = "Find",
      b = { "<cmd>Telescope file_browser<cr>", "Open file browser" },
      B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      f = { "<cmd>Telescope find_files<cr>", "File" },
      g = { "<cmd>Telescope live_grep<cr>", "Find grep" },
      n = { "<cmd>enew<cr>", "New File" },
      p = { "<cmd>Telescope projects<cr>", "Open project manajer" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent file" },
      s = { "<cmd>Telescope sessions<cr>", "Last Seasons" },
      t = { "<cmd>Telescope help_tags<cr>", "Tags" }
    },
    h = { "<cmd>set hlsearch!<cr>", "Hightlight text toggle" },
    i = { "<cmd>IndentBlacklineToggle<cr>", "Indentation line toggle" },
    j = {
      name = "Jump (HoP)",
      c = { "<cmd>HopChar1<cr>", "One char mode" },
      C = { "<cmd>HopChar2<cr>", "Two char mode" },
      p = { "<cmd>HopPattern<cr>", "Pattern mode"},
      w = { "<cmd>HopWord<cr>", "Word mode" },
    },
    g = {
      name = "Git",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require\"gitsigns\".blame_line()<CR>", "Line Blame" },
      p = { "<cmd>lua require\"gitsigns\".preview_hunk()<CR>", "Preview hunk" },
      r = { "<cmd>lua require\"gitsigns\".reset_hunk()<CR>", "Reset hunk" },
      R = { "<cmd>lua require\"gitsigns\".reset_buffer()<CR>", "Reset buffer" },
      s = { "<cmd>lua require\"gitsigns\".stage_hunk()<CR>", "Stage hunk" },
      t = { toggle_lazygit, "Open terminal (lazygit)" },
      u = { "<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>", "Undo stage hunk" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    },
    l = {
      name = "LSP",
      a = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code action"},
      A = { "<cmd>LspStop<CR><cmd>LspStart<CR>", "Activate/reactivate LSP"},
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      F = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "LSP Finder" },
      f = { "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", "Format current buffer(native LSP)" },
      h = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", "Hover"},
      i = { "<cmd>LspInfo<cr>", "LSP Info" },
      l = { "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", "Line diagnostics" },
      p = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Preview definition" },
      r = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename" },
      R = { "<cmd>lua vim.lsp.buf.references()<CR>", "Referece" },
      s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signture_help"},
      t = {
        name = "+Trouble list",
        b = { "<cmd>TroubleToggle document_diagnostics<cr>", "Current buffer diagnostics" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Current workspace diagnostics" },
        d = { "<cmd>TroubleToggle definitions<cr>", "Definition" },
        t = { "<cmd>TroubleToggle type_definitions<cr>", "Type definition"},
      },
    },
    p = {
      name = "Plugin action",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      e = { "<cmd>e " .. vim.fn.stdpath('config') .. "/lua/plugins.lua<cr>", "Edit (configure) plugins" },
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
      a = { "<cmd>1ToggleTerm<CR>", "Terminal 1" },
      b = { "<cmd>2ToggleTerm<CR>", "Terminal 2" },
      c = { "<cmd>3ToggleTerm<CR>", "Terminal 3" },
      d = { "<cmd>4ToggleTerm<CR>", "Terminal 4" },
      e = { "<cmd>5ToggleTerm<CR>", "Terminal 5" },
      f = { toggle_float, "Terminal (floating)" },
      p = { toggle_pwsh, "Terminal (pwsh)" },
    },
    w = { ":w<cr>", "Write (save)" },
    -- W = { ":w<cr><cmd>FormatWrite<cr>", "Write and format" },
    W = { "<cmd>lua vim.lsp.buf.formatting_sync()<CR><cmd>write<cr>", "Write and format" },
  },
  ["["] = {
    d = { "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", "Jump to previous diagnostics" },
    h = { "<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>", "Jump to previous hunk" },
  },
  ["]"] = {
    d = { "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", "Jump to next diagnostics" },
    h = { "<cmd>lua require\"gitsigns.actions\".prev_next()<CR>", "Jump to next hunk" },
  },
})
