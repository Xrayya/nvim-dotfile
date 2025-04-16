---@type LazySpec
return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    ---@type ts_context_commentstring.Config
    opts = {
      enable_autocmd = false,
    },
    config = function(_, opts)
      require("ts_context_commentstring").setup(opts)

      local get_option = vim.filetype.get_option
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.filetype.get_option = function(filetype, option)
        return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
          or get_option(filetype, option)
      end
    end,
  },
  {
    "folke/todo-comments.nvim",
    opts = {},
  },
  { "nvim-lua/plenary.nvim", lazy = true },
}
