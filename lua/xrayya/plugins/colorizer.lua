local colorizer = {
  "NvChad/nvim-colorizer.lua",
  event = "VeryLazy",
  config = function()
    require("colorizer").setup({
      filetypes = {
        "*",
        css = { RRGGBBAA = true, css = true, tailwind = "lsp" },
        html = { RRGGBBAA = true, css = true, tailwind = "lsp" },
        javascript = { RRGGBBAA = true, css = true, tailwind = "lsp" },
        javascriptreact = { RRGGBBAA = true, css = true, tailwind = "lsp" },
        typescript = { RRGGBBAA = true, css = true, tailwind = "lsp" },
        typescriptreact = { RRGGBBAA = true, css = true, tailwind = "lsp" },
        cmp_docs = { always_update = true },
        cmp_menu = { always_update = true },
        dart = { AARRGGBB = true },
      },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
      },
    })
  end,
}

return colorizer
