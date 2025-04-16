---@type LazySpec
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    ---@type tokyonight.Config
    opts = {
      style = "night",
      light_style = "day",
      transparent = true,
      on_highlights = function(highlights, colors)
        highlights.LineNr.fg = highlights.LspInlayHint.fg
        highlights.LineNrAbove.fg = highlights.LspInlayHint.fg
        highlights.LineNrBelow.fg = highlights.LspInlayHint.fg
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.has_no_bg_highlight = true
    end,
    ---@type CatppuccinOptions
    opts = {
      transparent_background = true,
      highlight_overrides = {
        all = function(colors)
          return {
            LineNr = { fg = colors.lavender },
            CursorLineNr = { fg = colors.peach },
          }
        end,
      },
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
