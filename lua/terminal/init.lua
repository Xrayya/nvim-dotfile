require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return 38
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  start_in_insert = false,
  insert_mappings = false,
  direction = 'horizontal',
  close_on_exit = true,
}

vim.cmd('nnoremap <silent><c-t> :1ToggleTerm<CR>')
vim.cmd('nnoremap <silent><c-s-T> :2ToggleTerm<CR>')

vim.cmd('tnoremap <silent><esc> <C-\\><c-n>')

vim.cmd([[
  autocmd TermEnter term://*toggleterm#*
        \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])

-- function _G.set_terminal_keymaps()
--   local opts = {noremap = true}
--   vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], opts)
--   vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
-- end
-- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
