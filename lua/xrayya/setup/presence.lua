local presence = {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      main_image = "file",
    })
  end,
}

return presence
