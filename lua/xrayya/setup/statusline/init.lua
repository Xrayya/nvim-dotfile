local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup(require("xrayya.setup.statusline.custom-statusline.extended-lualine"))
  end,
}

return lualine
