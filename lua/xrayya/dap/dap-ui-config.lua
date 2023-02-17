local dapui = NOTIF_REQ("dapui", "xrayya.dap.dap-ui-config", "error")
if dapui == nil then
  return
end

local dap = NOTIF_REQ("dap", "xrayya.dap.dap-ui-config", "error")

local icons = require("icons")

local M = {}
M.setup_debugging = function()
  vim.cmd([[ lua package.loaded.dapui=nil]])
  dapui.setup({
    icons = { expanded = icons.ui.ArrowOpen, collapsed = icons.ui.ArrowClosed },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          -- "repl",
          "console",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
    floating = {
      max_height = 0.5, -- These can be integers or a float between 0 and 1.
      max_width = 0.5, -- Floats will be treated as percentage of your screen.
      border = "rounded", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
    },
  })
end

M.setup_running = function()
  vim.cmd([[ lua package.loaded.dapui=nil]])
  dapui.setup({
    icons = { expanded = icons.ui.ArrowOpen, collapsed = icons.ui.ArrowClosed },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
      {
        elements = {
          -- "repl",
          "console",
        },
        size = 0.33, -- 33% of total lines
        position = "bottom",
      },
    },
    floating = {
      max_height = 0.5, -- These can be integers or a float between 0 and 1.
      max_width = 0.5, -- Floats will be treated as percentage of your screen.
      border = "rounded", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
    },
  })
end

vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapBreakpointCondition", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapLogPoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapBreakpointRejected", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = icons.ui.Label, texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })

if dap ~= nil then
  -- set external terminal
  -- dap.defaults.fallback.external_terminal = {
  --   command = "cmd.exe",
  --   args = { '' },
  -- }

  -- option to force debugger to use external terminal
  -- dap.defaults.fallback.force_external_terminal = true

  -- launch or close dapui when dap is invoked
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  -- dap.listeners.after.event_initialized["testing"] = function()
  --   vim.notify("Entering testing key")
  -- end
  -- dap.listeners.before.event_terminated["dapui_config"] = function()
  --   dapui.close()
  -- end
  -- dap.listeners.before.event_exited["dapui_config"] = function()
  --   dapui.close()
  -- end
end

vim.cmd([[ command! DapSetupDebugging execute 'lua require("xrayya.dap.dap-ui-config").setup_debugging()<cr>' ]])
vim.cmd([[ command! DapSetupRunning execute 'lua require("xrayya.dap.dap-ui-config").setup_running()<cr>' ]])

return M
