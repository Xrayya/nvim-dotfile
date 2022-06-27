require 'nvim-treesitter.install'.compilers = { "gcc", "clang" }
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "html",
    "css",
    "tsx",
    "typescript",
    "javascript",
    "json",
    "lua",
    "markdown",
    "yaml",
    "python",
    "java",
    "cpp",
    "c",
  },
  highlight = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  -- autotag = {
  --   enable = true,
  -- },
  autopairs = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}
