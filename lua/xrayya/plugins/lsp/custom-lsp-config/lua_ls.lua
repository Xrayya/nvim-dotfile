return {
  -- cmd = {'' .. vim.fn.stdpath('data') .. '/mason/bin/lua-language-server.cmd'};
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      hint = {
        enable = true,
        arrayIndex = "Disable",
        await = true,
        paramName = "All",
        paramType = true,
        semicolon = "SameLine",
        setType = true,
      },
      runtime = {
        special = {
          reload = "require",
        },
        version = "LuaJIT",
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
          [vim.fn.stdpath("config") .. "/ftplugin"] = true,
          [vim.fn.stdpath("data") .. "/lazy"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
