local colorizer = require("functions").notifreq("colorizer", "colorizer-config", "error")
if colorizer == nil then
  return
end

colorizer.setup({
  "*",
  css = { RRGGBBAA = true, css = true },
  html = { RRGGBBAA = true, css = true },
  javascript = { RRGGBBAA = true, css = true },
})
