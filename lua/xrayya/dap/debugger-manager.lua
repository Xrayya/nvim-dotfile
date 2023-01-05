local mason_dap = NOTIF_REQ("mason-nvim-dap", "xrayya.dap.debugger-manager", "error")
if mason_dap == nil then
  return
end

local dap = NOTIF_REQ("dap", "xrayya.dap.debugger-manager", "error")
if dap == nil then
  return
end

require("mason-nvim-dap").setup({
  ensure_installed = { "cppdbg", "python", "node2", "php", "javadbg", "javatest" },
  automatic_setup = true,
})

require("mason-nvim-dap").setup_handlers({
  function(source_name)
    -- all sources with no handler get passed here

    -- Keep original functionality of `automatic_setup = true`
    require("mason-nvim-dap.automatic_setup")(source_name)
  end,
  cppdbg = function(source_name)
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = vim.fn.glob(
        vim.fn.stdpath("data") .. "\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe"
      ),
      options = {
        detached = false,
      },
    }
    dap.configurations.cpp = dap.configurations.cpp or {}
    table.insert(dap.configurations.cpp, 1, {
      name = "Cpptools: Launch this file",
      type = "cppdbg",
      request = "launch",
      program = function()
        -- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        return vim.fn.expand("%:p:r") .. ".exe"
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
    })
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.rust
  end,
  node2 = function(source_name)
    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "\\mason\\packages\\node-debug2-adapter\\out\\src\\nodeDebug.js" },
    }
    dap.configurations.javascript = dap.configurations.javascript or {}
    table.insert(dap.configurations.javascript, 1, {
      name = "Node2: Launch this file",
      type = "node2",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    })
    table.insert(dap.configurations.javascript, 1, {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = "Node2: Attach to process",
      type = "node2",
      request = "attach",
      processId = require("dap.utils").pick_process,
    })

    dap.configurations.typescript = dap.configurations.javascript
    dap.configurations.javascriptreact = dap.configurations.javascript
    dap.configurations.typescriptreact = dap.configurations.javascript
  end,
  chrome = function(source_name)
    dap.adapters.chrome = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "\\mason\\packages\\chrome-debug-adapter\\out\\src\\chromeDebug.js" },
    }
    dap.configurations.javascript = dap.configurations.javascript or {}
    table.insert(dap.configurations.javascript, 1, {
      name = "Chrome: attach",
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    })
    dap.configurations.typescript = dap.configurations.javascript
    dap.configurations.javascriptreact = dap.configurations.javascript
    dap.configurations.typescriptreact = dap.configurations.javascript
  end,
})
