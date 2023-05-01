-- Setup settings
require("user-functions")
require("keymappings")
require("settings")
require("plugins")
require("autocommands")

if vim.fn.has("unix") then
  vim.cmd("source ~/.config/nvim/vim-config/themes.vim")
  vim.cmd("source ~/.config/nvim/vim-config/nvide.vim")
  vim.cmd("source ~/.config/nvim/vim-config/fold-config.vim")
elseif vim.fn.has("win32") then
  vim.cmd("source ~/AppData/Local/nvim/vim-config/themes.vim")
  vim.cmd("source ~/AppData/Local/nvim/vim-config/nvide.vim")
  vim.cmd("source ~/AppData/Local/nvim/vim-config/fold-config.vim")
end
