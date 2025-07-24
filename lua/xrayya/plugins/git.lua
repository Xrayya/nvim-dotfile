---@type LazySpec
return {
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      attach_to_untracked = true,
      current_line_blame = true,
      preview_config = {
        border = "rounded",
      },
    },
  },
}
