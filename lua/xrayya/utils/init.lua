---@class xrayvim.util
---@field config xrayvim.config
---@field color xrayvim.util.color
local M = {}

setmetatable(M, {
  __index = function(t, k)
    ---@diagnostic disable-next-line: no-unknown
    t[k] = require("xrayya.utils." .. k)
    return t[k]
  end,
})

---@param table1 table
---@param table2 table
---@return table
M.merge_table_as_set = function(table1, table2)
  local set = {}
  local keys = vim.tbl_values(table1)
  for _, key in pairs(keys) do
    set[key] = true
  end

  keys = vim.tbl_values(table2)
  for _, key in pairs(keys) do
    set[key] = true
  end

  return vim.tbl_keys(set)
end

M.debug_print = function(item)
  print(vim.inspect(item))
end

return M
