---@type LazySpec
return {
  "Shatur/neovim-session-manager",
  config = function()
    require("session_manager").setup({
      autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
    })
  end,
}
