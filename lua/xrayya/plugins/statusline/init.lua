local lualine = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup(require("xrayya.plugins.statusline.custom-statusline.extended-lualine"))
  end,
}

return lualine
