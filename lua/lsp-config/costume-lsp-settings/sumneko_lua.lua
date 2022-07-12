return {
  -- cmd = {'' .. vim.fn.stdpath('data') .. '/lsp_servers/sumneko_lua/extension/server/bin/Windows/lua-language-server'};
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
