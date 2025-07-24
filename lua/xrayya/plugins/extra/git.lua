---@type LazySpec
return {
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lazygit_floating_window_scaling_factor = 0.8
    end,
  },
}
