---@type LazySpec
return {
  "lervag/vimtex",
  enabled = false,
  init = function()
    vim.g.vimtex_mappings_prefix = "<leader>L"
  end,
}
