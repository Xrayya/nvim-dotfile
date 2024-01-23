local vim_habit = {
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local disabled_filetypes = require("hardtime.config").config.disabled_filetypes
      table.insert(disabled_filetypes, "sudoku")

      require("hardtime").setup({
        max_time = 2000,
        max_count = 8,
        disable_mouse = false,
        disabled_filetypes = disabled_filetypes,
        allow_different_key = true,
      })
    end,
  },
}

return vim_habit
