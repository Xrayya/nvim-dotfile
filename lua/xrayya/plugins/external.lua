local external = {
  {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    config = function()
      require("cord").setup({
        text = {
          viewing = "Viewing {}",
          editing = "Editing {}",
          file_browser = "Browsing files in {}",
          plugin_manager = "Managing plugins in {}",
          lsp_manager = "Configuring LSP in {}",
          vcs = "Committing changes in {}",
          workspace = "Workspace: {}",
        },
      })
    end,
  },
  { "wakatime/vim-wakatime", lazy = false },
}

return external
