local treesitter = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("ts_context_commentstring").setup()
        end,
      },
      "RRethy/nvim-treesitter-endwise",
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup({
            check_ts = true,
          })
        end,
      },
    },
    config = function()
      require("nvim-treesitter.install").compilers = { "gcc", "clang" }

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "comment",
          "cpp",
          "css",
          "csv",
          "dart",
          "fish",
          "html",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "java",
          "javascript",
          "json",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "php",
          "phpdoc",
          "python",
          "scss",
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
          disable = { "html", "dart" },
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
        endwise = {
          enable = true,
        },
      })
    end,
  },
  {
    "luckasRanarison/tree-sitter-hypr",
    enabled = (vim.fn.executable("Hyprland") > 0 and true or false),
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}

return treesitter
