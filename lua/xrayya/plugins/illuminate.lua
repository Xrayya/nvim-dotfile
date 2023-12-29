local illuminate = {
  "RRethy/vim-illuminate",
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
