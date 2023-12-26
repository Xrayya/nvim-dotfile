local presence = {
  "andweeb/presence.nvim",
  enabled = false,
  config = function()
    require("presence").setup({
      main_image = "file",
    })
  end,
}

return presence
