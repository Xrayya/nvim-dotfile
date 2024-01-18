local games = {
  {
    "theprimeagen/vim-be-good",
  },
  {
    "seandewar/nvimesweeper",
  },
  {
    "jim-fx/sudoku.nvim",
    cmd = "Sudoku",
    config = function()
      require("sudoku").setup({})

      vim.api.nvim_create_augroup("sudokuOptions", {})
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sudoku" },
        group = "sudokuOptions",
        callback = function(args)
          vim.opt_local.cursorline = false
        end,
      })
    end,
  },
}

return games
