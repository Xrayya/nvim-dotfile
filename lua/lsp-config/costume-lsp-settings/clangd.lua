return {
  cmd = {
    vim.fn.stdpath("data") .. "\\lsp_servers\\clangd\\clangd\\bin\\clangd.exe",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    -- "--fallback-style='{BasedOnStyle: LLVM; IndentWidth: 4}'",
    "--query-driver=C:\\Users\\Hary\\scoop\\apps\\gcc\\current\\bin\\g++.exe",
    "--resource-dir=C:\\Users\\Hary\\scoop\\apps\\gcc\\current\\lib\\gcc\\x86_64-w64-mingw32\\11.2.0\\",
  },
}
