local presence = {
  {
    "Xrayya/neocord",
    event = "VeryLazy",
    config = function()
      require("neocord").setup({
        global_timer = true,
        project_fallback = function(project_path)
          if package.loaded["project_nvim"] and #vim.lsp.buf.list_workspace_folders() > 0 then
            local pwd = vim.fn.getcwd()
            return pwd:match(string.format("^.+%s(.+)$", package.config:sub(1, 1))), pwd
          end
        end,
      })
    end,
  },
  {
    "neoclide/coc.nvim",
    enabled = false,
    branch = "release",
    build = ":CocInstall coc-discord-rpc",
  },
}

return presence
