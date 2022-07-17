local notify = require("functions").notifreq("notify", "notification-config", "error")
if notify == nil then
  return
end

local icons = require("icons")

vim.notify = notify

notify.setup({
  timeout = 1000,
  background_colour = "#000000",
  fps = 30,
  -- stylua: ignore
  icons = {
    DEBUG = icons.ui.Bug,
    ERROR = icons.diagnostics.Error,
    INFO  = icons.diagnostics.Information,
    TRACE = icons.ui.Pencil2,
    WARN  = icons.diagnostics.Warning,
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out",
})
