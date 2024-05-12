vim.api.nvim_create_user_command("Set4Space", function(args)
  vim.opt_local.tabstop = 4
  vim.opt_local.shiftwidth = 4
  vim.opt_local.softtabstop = 4
end, {})

vim.api.nvim_create_user_command("Set2Space", function(args)
  vim.opt_local.tabstop = 2
  vim.opt_local.shiftwidth = 2
  vim.opt_local.softtabstop = 2
end, {})
