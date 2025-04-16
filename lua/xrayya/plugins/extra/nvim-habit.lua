---@type LazySpec
return {
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      max_time = 2000,
      max_count = 8,
      disable_mouse = false,
      allow_different_key = true,
    },
    config = function(_, opts)
      local disabled_filetypes = require("hardtime.config").config.disabled_filetypes
      table.insert(disabled_filetypes, "sudoku")

      opts.disabled_filetypes = disabled_filetypes

      require("hardtime").setup(opts)
    end,
  },
}
