local color_functions = {}
color_functions.convert_decimal_to_hex = function (decimal_value)
  if decimal_value == nil then
    return nil
  end
  return string.format("#%x", decimal_value)
end

return color_functions
