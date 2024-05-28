local navigation = {
  {
    "phaazon/hop.nvim",
    enabled = false,
    config = function()
      require("hop").setup()

      vim.keymap.set(
        "",
        "f",
        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>",
        {}
      )
      vim.keymap.set(
        "",
        "F",
        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR})<cr>",
        {}
      )
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    config = function()
      require("numb").setup({
        show_numbers = true,
        show_cursorline = true,
        number_only = true,
        centered_peeking = true,
      })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb", "gg", "G" },
        hide_cursor = false,
      })
    end,
  },
}

return navigation
