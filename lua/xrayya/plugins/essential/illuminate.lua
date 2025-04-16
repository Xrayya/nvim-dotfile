---@type LazySpec
return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "alpha",
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
