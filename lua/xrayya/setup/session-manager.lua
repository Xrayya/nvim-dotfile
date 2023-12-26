local session_manager = {
  "Shatur/neovim-session-manager",
  config = function()
    require("session_manager").setup({
      autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
    })
  end,
}

return session_manager
