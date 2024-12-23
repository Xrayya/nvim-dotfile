local treesitter = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup()
        end,
      },
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "RRethy/nvim-treesitter-endwise",
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup({
            check_ts = true,
          })
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
          require("treesitter-context").setup({
            max_lines = 5,
            line_numbers = true,
            multiline_threshold = 1,
            trim_scope = "outer",
          })
        end,
      },
    },
    config = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      -- vim.cmd([[
      --     augroup BladeFiltypeRelated
      --       au BufNewFile,BufRead *.blade.php set ft=blade
      --     augroup END
      -- ]])

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
          "diff",
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
          "regex",
          "scss",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
        highlight = {
          enable = true,
          disable = { "latex" },
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
        autopairs = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["if"] = "@function.inner",
              ["af"] = "@function.outer",
              ["icl"] = "@class.inner",
              ["acl"] = "@class.outer",
              ["ico"] = "@conditional.inner",
              ["aco"] = "@conditional.outer",
              ["il"] = "@loop.inner",
              ["al"] = "@loop.outer",
              ["ia"] = "@parameter.inner",
              ["aa"] = "@parameter.outer",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]cl"] = "@class.outer",
              ["]co"] = "@conditional.outer",
              ["]l"] = "@loop.outer",
              ["]a"] = "@parameter.inner",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]CL"] = "@class.outer",
              ["]CO"] = "@conditional.outer",
              ["]L"] = "@loop.outer",
              ["]A"] = "@parameter.inner",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[cl"] = "@class.outer",
              ["[co"] = "@conditional.outer",
              ["[l"] = "@loop.outer",
              ["[a"] = "@parameter.inner",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[CL"] = "@class.outer",
              ["[CO"] = "@conditional.outer",
              ["[L"] = "@loop.outer",
              ["[A"] = "@parameter.inner",
            },
          },
        },
      })

      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
      vim.o.foldlevelstart = 99
    end,
  },
}

return treesitter
