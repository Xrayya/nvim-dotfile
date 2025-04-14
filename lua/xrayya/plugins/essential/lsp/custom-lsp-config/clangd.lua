local query_driver, resource_dir
if vim.fn.has("win32") > 0 then
  query_driver = "C:\\Users\\Hary\\scoop\\apps\\msys2\\current\\mingw64\\bin\\g++.exe"
  resource_dir = "C:\\Users\\Hary\\scoop\\apps\\msys2\\current\\mingw64\\lib\\gcc\\x86_64-w64-mingw32\\12.2.0\\"
end

local cmd = {
  "clangd",
  "--background-index",
  "--pch-storage=memory",
  "--clang-tidy",
}

if query_driver ~= nil then
  cmd[#cmd + 1] = "--query-driver=" .. query_driver
end

if resource_dir ~= nil then
  cmd[#cmd + 1] = "--resource-dir=" .. resource_dir
end

return {
  cmd = cmd,
}
