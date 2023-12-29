local typescript_tools = {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("typescript-tools").setup({
      init_options = {
        preferences = {
          importModuleSpecifierPreference = "non-relative",
        },
      },
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      settings = {
        publish_diagnostic_on = "change",
        expose_as_code_action = "all",
        complete_function_calls = true,
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
        },
      },
    })
  end,
}

return typescript_tools
