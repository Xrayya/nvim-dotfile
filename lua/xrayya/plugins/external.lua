local external = {
  {
    "Xrayya/neocord",
    enabled = false,
    branch = "project_detection_fallback_function",
    event = "VeryLazy",
    config = function()
      require("neocord").setup({
        global_timer = true,
        project_detection_fallback_fn = function(file_path)
          if package.loaded["project_nvim"] then
            local pwd = vim.fn.getcwd()
            return pwd:match(string.format("^.+%s(.+)$", package.config:sub(1, 1))), pwd
          end
        end,
        workspace_text = function(project_name, file_name)
          if file_name ~= "" and #vim.lsp.buf.list_workspace_folders() > 0 then
            return string.format("Project: %s", project_name)
          else
            return string.format("Workspace: %s", project_name)
          end
        end,
      })
    end,
  },
  { 'wakatime/vim-wakatime', lazy = false }
}

return external
