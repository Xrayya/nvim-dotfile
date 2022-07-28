local dap = require("functions").notifreq("dap", "dap-config.debuggers.cpptools", "error")

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "D:\\My Programming Projects\\Repos\\cpptools-win32\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
  options = {
    detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      -- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      return vim.fn.expand("%:p:r") .. ".exe"
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
  },
  -- {
  --   name = "Attach to gdbserver :1234",
  --   type = "cppdbg",
  --   request = "launch",
  --   MIMode = "gdb",
  --   miDebuggerServerAddress = "localhost:1234",
  --   miDebuggerPath = "C:\\Users\\Hary\\scoop\\shims\\gdb.exe",
  --   cwd = "${workspaceFolder}",
  --   program = function()
  --     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  --   end,
  -- },
}

dap.configurations.c = dap.configurations.cpp

-- dap.listeners.before.event_initialized["cpptools"] = function()
--   if vim.bo.filetype == "cpp" then
--     vim.fn.system({
--       "g++",
--       "-fdiagnostics-color=always",
--       "-g",
--       '"' .. vim.fn.expand("%:p") .. '"',
--       "-o",
--       '"' .. vim.fn.expand("%:p:r") .. '.exe"'
--     })
--   end
-- end
