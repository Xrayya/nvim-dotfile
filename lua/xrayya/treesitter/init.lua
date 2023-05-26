local treesitter = NOTIF_REQ("nvim-treesitter.configs", "treesitter-config", "error")
if treesitter == nil then
  return
end

require("nvim-treesitter.install").compilers = { "gcc", "clang" }

treesitter.setup({
  ensure_installed = {
    "c",
    "comment", -- for comment highlighting like @params, @return, etc
    "cpp",
    "css",
    "dart",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "markdown",
    "php",
    "python",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
})
