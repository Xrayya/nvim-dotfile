require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return 38
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = false,
  direction = 'horizontal',
  close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

vim.cmd('tnoremap <silent><esc><esc> <C-\\><c-n>')

-- vim.cmd([[
--   autocmd TermEnter term://*toggleterm#*
--         \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])

-- function _G.set_terminal_keymaps()
--   local opts = {noremap = true}
--   vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], opts)
--   vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
-- end
-- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

-- Lazygit terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  count = 9,
  direction = "float",
  hidden = true,
})
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Cmd terminals
local cmd1 = Terminal:new({
  cmd = "pwsh",
  count = 1,
  size = 38,
  direction = "horizontal",
  hidden = true,
})
function _CMD1_TOGGLE()
  cmd1:toggle()
end

local cmd2 = Terminal:new({
  cmd = "pwsh",
  count = 2,
  size = 38,
  direction = "horizontal",
  hidden = true,
})
function _CMD2_TOGGLE()
  cmd2:toggle()
end

local cmd3 = Terminal:new({
  cmd = "pwsh",
  count = 3,
  size = 38,
  direction = "horizontal",
  hidden = true,
})
function _CMD3_TOGGLE()
  cmd3:toggle()
end

-- Node terminal
local node = Terminal:new({
  cmd = "node",
  count = 4,
  size = 38,
  direction = "horizontal",
  hidden = true,
})
function _NODE_TOGGLE()
  node:toggle()
end

-- Python terminal
local python = Terminal:new({
  cmd = "python",
  count = 5,
  size = 38,
  direction = "horizontal",
  hidden = true,
})
function _PYTHON_TOGGLE()
  python:toggle()
end

-- pwsh terminal
local pwsh = Terminal:new({
  cmd = "pwsh",
  count = 6,
  direction = "horizontal",
  size = 22,
  hidden = true,
})
function _PWSH_TOGGLE()
  pwsh:toggle()
end

-- Vertical pwsh terminal
local v_pwsh = Terminal:new({
  cmd = "pwsh",
  count = 7,
  size = vim.o.columns * 0.4,
  direction = "vertical",
  hidden = true,
})
function _V_PWSH_TOGGLE()
  v_pwsh:toggle()
end

-- Floating pwsh terminal
local f_pwsh = Terminal:new({
  cmd = "pwsh",
  count = 8,
  direction = "float",
  hidden = true,
})
function _F_PWSH_TOGGLE()
  f_pwsh:toggle()
end
