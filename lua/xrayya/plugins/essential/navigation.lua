---@type LazySpec
return {
  {
    "phaazon/hop.nvim",
    enabled = false,
    opts = {},
    keys = {
      {
        "f",
        function()
          require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
        end,
        mode = "",
      },
      {
        "F",
        function()
          require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
        end,
        mode = "",
      },
    },
  },
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    otps = {
      show_numbers = true,
      show_cursorline = true,
      number_only = true,
      centered_peeking = true,
    },
  },
  {
    "karb94/neoscroll.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb", "gg", "G" },
      hide_cursor = false,
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      -- { "<c-s-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
