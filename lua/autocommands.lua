if vim.fn.has("nvim-0.8") == 1 then
  vim.api.nvim_create_autocmd(
    { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    {
      callback = function()
        local status_ok, winbar = pcall(require, "winbar")
        if not status_ok then
          vim.notify('autocommands: failed to load "winbar" module')
        else
          winbar.get_winbar()
        end
      end,
    }
  )
end
