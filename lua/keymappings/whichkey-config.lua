local wk = require("which-key")

-- Setup for toggleterm
local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function ()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end
local toggle_lazygit = function ()
  local lazy = Terminal:new({cmd = "lazygit", direction = "float"})
  return lazy:toggle()
end

wk.register({
  ["<leader>"] = {
    c = {
      name = "Commentary",
      i = {
        name = "Increase (motion's enable)",
        c = { "<Plug>kommentary_motion_increase<cr>", "Current line" },
      },
      d = {
        name = "Decrease (motion's enable)",
        c = { "<Plug>kommentary_motion_decrease<cr>", "Current line" },
      },
    },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    f = {
      name = "Find",
      b = { "<cmd>Telescope buffers<cr>", "Buffer" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      f = { "<cmd>Telescope find_files<cr>", "File" },
      g = { "<cmd>Telescope live_grep<cr>", "Find grep" },
      n = { "<cmd>enew<cr>", "New File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent file" },
      s = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      t = { "<cmd>Telescope help_tags<cr>", "Tags" }
    },
    h = { "<cmd>set hlsearch!", "Hightlight text toggle" },
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
      b = { "<cmd>lua require\"gitsigns\".blame_line()<CR>", "Blame line" },
      p = { "<cmd>lua require\"gitsigns\".preview_hunk()<CR>", "Preview hunk" },
      r = { "<cmd>lua require\"gitsigns\".reset_hunk()<CR>", "Reset hunk" },
      s = { "<cmd>lua require\"gitsigns\".stage_hunk()<CR>", "Reset hunk" },
      u = { "<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>", "Reset hunk" },
    },
    l = {
      name = "LSP",
      a = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code action"},
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      D = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Preview definition" },
      f = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "LSP Finder" },
      h = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", "Hover"},
      l = { "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", "Line diagnostics" },
      r = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename" },
      R = { "<cmd>lua vim.lsp.buf.references()<CR>", "Referece" },
      s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signture_help"},
      t = {
        name = "+Trouble list",
        b = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Current buffer diagnostics" },
        w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Current workspace diagnostics" },
        d = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definition" },
        t = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "Type definition"},
      },
    },
    p = {
      name = "Plugin action",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      r = { "<cmd>PackerClean<cr>", "Remove" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Update and compile" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
    },
    t = {
      name = "Terminal",
      a = { "<cmd>1ToggleTerm<CR>", "Terminal 1" },
      b = { "<cmd>2ToggleTerm<CR>", "Terminal 2" },
      c = { "<cmd>3ToggleTerm<CR>", "Terminal 3" },
      d = { "<cmd>4ToggleTerm<CR>", "Terminal 4" },
      e = { "<cmd>5ToggleTerm<CR>", "Terminal 5" },
      f = { toggle_float, "Terminal (floating)" },
      l = { toggle_lazygit, "Terminal (lazygit)" },
    },
    w = { ":w<cr>", "Write (save)" },
    W = { ":wq<cr>", "Write (save) and quit" },
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
