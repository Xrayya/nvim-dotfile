local presence = {
  {
    "IogaMaster/neocord",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("neocord").setup()
    end,
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
    build = ":CocInstall coc-discord-rpc",
  },
}

return presence
