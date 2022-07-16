local notify = require("functions").notifreq("notify", "notification-config", "error")
if notify == nil then
  return
end

vim.notify = notify

notify.setup({
  timeout = 1000,
  background_colour = "#000000",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out",
})
