return {
  -- cmd = {'' .. vim.fn.stdpath('data') .. '/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server.exe'};
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
          vim.api.nvim_get_runtime_file("", true),
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
