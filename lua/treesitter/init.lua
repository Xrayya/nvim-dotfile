require 'nvim-treesitter.install'.compilers = { "gcc", "clang" }
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
