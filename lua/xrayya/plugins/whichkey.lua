local whichkey = {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    local whichkey = require("which-key")
    whichkey.setup({
      win = {
        border = "rounded",
      },
      layout = {
        align = "center",
      },
    })
  end,
}

return whichkey
