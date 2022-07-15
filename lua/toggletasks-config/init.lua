local status_ok, toggletasks = pcall(require, "toggletasks")
if not status_ok then
  vim.notify('toggletasks-config: failed to load "toggletasks" module')
  return
end

toggletasks.setup()
