require("dap-config.dap-ui-config").setup_running()
require("dap-config.debuggers")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<F5>", "<cmd>DapContinue<cr>", opts)
map("n", "<S-F5>", "<cmd>DapTerminate<cr>", opts)
map("n", "<F9>", '<cmd>DapToggleBreakpoint<cr>', opts)
map("n", "<S-F9>", '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', opts)
map("n", "<F10>", "<cmd>DapStepOver<cr>", opts)
map("n", "<F11>", "<cmd>DapStepInto<cr>", opts)
map("n", "<S-F11>", "<cmd>DapStepOut<cr>", opts)
