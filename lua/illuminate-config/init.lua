local illuminate = NOTIF_REQ("illuminate", "illuminate-config", error)
if illuminate == nil then
  return
end

illuminate.configure({
  -- delay: delay in milliseconds
  delay = 100,
  -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "alpha",
    "NvimTree",
    "packer",
    "Trouble",
    "Outline",
    "toggleterm",
    "TelescopePrompt",
    "JABSwindow",
    "lspinfo",
    "mason",
    "null-ls-info",
  },
  -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
  modes_denylist = {},
  -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
  modes_allowlist = {},
  -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_denylist = {},
  -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_allowlist = {},
  -- under_cursor: whether or not to illuminate under the cursor
  under_cursor = true,
  -- max_file_lines: max number of lines in a file to illuminate
  max_file_lines = nil,
})
vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".goto_next_reference{}<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<a-N>", '<cmd>lua require"illuminate".goto_prev_reference{}<cr>', { noremap = true })
