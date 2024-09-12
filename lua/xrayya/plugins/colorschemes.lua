local colorschemes = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        light_style = "day",
        transparent = true,
        on_highlights = function(highlights, colors)
          highlights.LineNr.fg = highlights.LspInlayHint.fg
          highlights.LineNrAbove.fg = highlights.LspInlayHint.fg
          highlights.LineNrBelow.fg = highlights.LspInlayHint.fg
        end,
      })
      vim.cmd.colorscheme("tokyonight")
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
              LineNr = { fg = colors.lavender },
              CursorLineNr = { fg = colors.peach },
            }
          end,
        },
      })
    end,
  },
}

return colorschemes
