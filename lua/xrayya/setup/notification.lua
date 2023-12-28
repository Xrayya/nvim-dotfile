local notification = {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    vim.notify = notify
    notify.setup({
      timeout = 1000,
      -- background_colour = "#000000",
      fps = 30,
    })
  end,
}

return notification
