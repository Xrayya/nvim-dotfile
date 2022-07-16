M = {}

-- Nvim config notification
function M.notify_config(msg, level)
  vim.notify(msg, level, {
    title = "nvim config file: " .. level
  })
end

return M
