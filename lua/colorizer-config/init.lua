local colorizer = NOTIF_REQ("colorizer", "colorizer-config", "error")
if colorizer == nil then
  return
end

colorizer.setup({
  filetypes = {
    "*",
    css = { RRGGBBAA = true, css = true },
    html = { RRGGBBAA = true, css = true },
    javascript = { RRGGBBAA = true, css = true },
  }
})
