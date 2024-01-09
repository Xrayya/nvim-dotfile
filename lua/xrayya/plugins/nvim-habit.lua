local vim_habit = {
  {
    "theprimeagen/vim-be-good",
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("hardtime").setup({
        max_time = 2000,
        max_count = 8,
        disable_mouse = false,
        allow_different_key = true,
      })
    end,
  },
}

return vim_habit
