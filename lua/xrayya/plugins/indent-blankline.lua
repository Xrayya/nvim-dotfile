local indent_blankline = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  config = function()
    local highlight = {
      "RainbowBlue",
      "RainbowOrange",
      "RainbowCyan",
      "RainbowViolet",
      "RainbowGreen",
      "RainbowRed",
      "RainbowYellow",
    }
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { link = "RainbowDelimiterRed" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { link = "RainbowDelimiterYellow" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { link = "RainbowDelimiterBlue" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { link = "RainbowDelimiterOrange" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { link = "RainbowDelimiterGreen" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { link = "RainbowDelimiterViolet" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { link = "RainbowDelimiterCyan" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    require("ibl").setup({
      indent = {
        char = "▏",
      },
      exclude = {
        filetypes = {
          "alpha",
          "NvimTree",
        },
      },
      scope = {
        highlight = highlight,
      },
    })
  end,
}

return indent_blankline
