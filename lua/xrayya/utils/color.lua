---@class xrayvim.util.color
local M = {}

---@param decimal_value integer
---@return string|nil
M.convert_decimal_to_hex = function(decimal_value)
  if decimal_value == nil then
    return nil
  end
  return string.format("#%x", decimal_value)
end

return M
