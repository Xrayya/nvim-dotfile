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
    config = function()
      require("numb").setup({
        show_numbers = true,
        show_cursorline = true,
        number_only = true,
        centered_peeking = true,
      })
    end,
  },
}

return navigation
