local presence = {
  {
    "Xrayya/neocord",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("neocord").setup({
        global_time = true,
        -- project_fallback = function(project_path)
        --   if package.loaded["project_nvim"] then
        --     local pwd = vim.fn.getcwd()
        --     return pwd:match(string.format("^.+%s(.+)$", package.config:sub(1, 1))), pwd
        --   end
        -- end,
      })
    end,
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
    build = ":CocInstall coc-discord-rpc",
  },
}

return presence
