local indent_blankline = {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = {
          "alpha",
          "NvimTree",
        },
      },
    })
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
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
    require("ibl").setup({ scope = { highlight = highlight } })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}

return indent_blankline
