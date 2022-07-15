local status_ok, colortils = pcall(require, "colortils")
if not status_ok then
  vim.notify('colortils-config: failed to load "colortils" module')
  return
end

colortils.setup()
