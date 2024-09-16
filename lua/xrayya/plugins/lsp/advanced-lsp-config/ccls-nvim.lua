local ccls_nvim = {
  "ranjithshegde/ccls.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local ccls_opts = require("xrayya.plugins.lsp.custom-lsp-config.ccls")

    local opts = vim.tbl_deep_extend("force", require("cmp_nvim_lsp").default_capabilities(), ccls_opts)

    require("ccls").setup({ lsp = { lspconfig = opts } })
  end,
}

return ccls_nvim
