function P(item)
  print(vim.inspect(item))
end

function LOAD_UTIL(util)
  return require("xrayya.utils." .. util)
end

function GET_KEYS(table)
  local keyset = {}
  for k, _ in pairs(table) do
    keyset[#keyset + 1] = k
  end
  return keyset
end

function GET_VALUES(table)
  local valueset = {}
  for _, v in pairs(table) do
    valueset[#valueset + 1] = v
  end
  return valueset
end
