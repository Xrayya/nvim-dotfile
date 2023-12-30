local notification = {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    vim.notify = notify

    local opts = {
      timeout = 1000,
      fps = 30,
    }
    if vim.g.has_no_bg_highlight then
      opts.background_colour = "#000000"
    end
    notify.setup(opts)
  end,
}

return notification
