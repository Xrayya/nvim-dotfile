local colorschemes = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        light_style = "day",
        transparent = true,
      })

      vim.api.nvim_set_hl(0, "LineNr", { link = "Number" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { link = "LineNr" })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.has_no_bg_highlight = true
    end,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        highlight_overrides = {
          all = function(colors)
            return {
              LineNr = { fg = require("catppuccin.groups.editor").get().CursorLineNr.fg },
            }
          end,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

return colorschemes
