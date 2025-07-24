---@type LazySpec
return {
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    config = function()
      -- require("CopilotChat.integrations.cmp").setup()

      require("CopilotChat").setup({
        mappings = {
          complete = {
            insert = "",
          },
        },
      })
    end,
  },
}
