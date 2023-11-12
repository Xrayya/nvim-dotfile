local query_driver, resource_dir
if vim.fn.has("win32") > 0 then
  query_driver = "C:\\Users\\Hary\\scoop\\apps\\msys2\\current\\mingw64\\bin\\g++.exe"
  resource_dir = "C:\\Users\\Hary\\scoop\\apps\\msys2\\current\\mingw64\\lib\\gcc\\x86_64-w64-mingw32\\12.2.0\\"
elseif vim.fn.has("unix") > 0 then
  query_driver = "/usr/bin/g++"
  resource_dir = "/usr/lib/gcc/x86_64-pc-linux-gnu/13.2.1"
end

return {
  cmd = {
    -- vim.fn.stdpath("data") .. "\\lsp_servers\\clangd\\clangd\\bin\\clangd.exe",
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    -- "--fallback-style='{BasedOnStyle: LLVM; IndentWidth: 4}'",
    "--query-driver=" .. query_driver,
    "--resource-dir=" .. resource_dir,
  },
}
