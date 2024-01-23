local illuminate = {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    require("illuminate").configure({
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
      },
    })
  end,
}

return illuminate
