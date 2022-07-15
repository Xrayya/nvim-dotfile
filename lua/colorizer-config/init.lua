local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  vim.notify('colorizer-config: failed to load "colorizer" module')
  return
end

colorizer.setup({
  "*",
  css = { RRGGBBAA = true, css = true },
  html = { RRGGBBAA = true, css = true },
  javascript = { RRGGBBAA = true, css = true },
})
