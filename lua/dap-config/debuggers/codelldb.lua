local dap = NOTIF_REQ("dap", "dap-config.debuggers.lldb-vscode", "error")

-- local lldb_host = "127.0.0.1"
-- local lldb_port = "34567"

-- local lldb_path = "D:\\My Programming Projects\\Repos\\codelldb-x86_64-windows"

-- dap.adapters.lldb = {
--   type = 'server',
--   host = lldb_host,
--   port = lldb_port,
--   executable = {
--     -- CHANGE THIS to your path!
--     command = lldb_path .. "\\extension\\adapter\\codelldb.exe",
--     args = {"--liblldb", lldb_path .. "\\liblldb.dll", "--port", lldb_port},

--     -- On windows you may have to uncomment this:
--     detached = false,
--   }
-- }

-- dap.configurations.cpp = {
--     {
--         name = "Debug",
--         type = "lldb",
--         request = "launch",
--         host = lldb_host,
--         port = lldb_port,
--         program = function()
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,
--         cwd = "${workspaceFolder}",
--         stopOnEntry = false,
--         args = {},
--     },
-- }
local lldb_host = "127.0.0.1"
local lldb_port = 34566

dap.adapters.lldb = {
  type = 'server',
  host = '127.0.0.1',
  port = lldb_port -- 💀 Use the port printed out or specified with `--port`
}

dap.configurations.cpp = {
    {
        name = "Debug",
        type = "lldb",
        request = "launch",
        host = lldb_host,
        port = lldb_port,
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

-- dap.adapters.lldb = function(callback, config)
--     callback({ type = "server", host = config.host, port = config.port })
-- end
