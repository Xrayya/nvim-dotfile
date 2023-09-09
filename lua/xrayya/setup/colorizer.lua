local colorizer = {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
        "*",
        css = { RRGGBBAA = true, css = true },
        html = { RRGGBBAA = true, css = true },
        javascript = { RRGGBBAA = true, css = true },
    })
  end,
}

return colorizer
