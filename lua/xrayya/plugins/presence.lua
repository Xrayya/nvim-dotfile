local presence = {
  {
    "Xrayya/neocord",
    branch = "project_detection_fallback_function",
    event = "VeryLazy",
    config = function()
      require("neocord").setup({
        global_timer = true,
        project_detection_fallback_fn = function(file_path)
          if package.loaded["project_nvim"] and #vim.lsp.buf.list_workspace_folders() > 0 then
            local pwd = vim.fn.getcwd()
            return pwd:match(string.format("^.+%s(.+)$", package.config:sub(1, 1))), pwd
          end
        end,
      })
    end,
  },
}

return presence
