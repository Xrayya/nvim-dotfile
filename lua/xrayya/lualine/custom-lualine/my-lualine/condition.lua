M = {}

function M.buffer_not_empty()
  return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
end

-- function M.hide_in_width()
--   return vim.fn.winwidth(0) > 130
-- end

-- function M.check_git_workspace()
--   local filepath = vim.fn.expand "%:p:h"
--   local gitdir = vim.fn.finddir(".git", filepath .. ";")
--   return gitdir and #gitdir > 0 and #gitdir < #filepath
-- end

return M
