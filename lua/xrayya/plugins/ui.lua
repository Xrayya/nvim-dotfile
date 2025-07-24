---@type LazySpec
return {
  {
    "folke/noice.nvim",
    -- enabled = false,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        ---@type notify.Config|nil
        ---@diagnostic disable-next-line: missing-fields
        opts = {
          timeout = 1000,
          fps = 30,
        },
        config = function(_, opts)
          local notify = require("notify")

          vim.notify = notify

          if vim.g.has_no_bg_highlight then
            opts.background_colour = "#000000"
          end

          notify.setup(opts)
        end,
      },
    },
    ---@type NoiceConfig
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      hover = {
        silent = true,
      },
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
      },
    },
    keys = {
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(1) then
            return "<c-f>"
          end
        end,
        mode = { "n", "i", "s" },
      },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-1) then
            return "<c-b>"
          end
        end,
        mode = { "n", "i", "s" },
      },
    },
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  {
    "shellRaining/hlchunk.nvim",
    enabled = false,
    opts = {
      chunk = {
        enable = true,
      },
      indent = {
        enable = true,
        use_treesitter = true,
        chars = { "▏" },
      },
      line_num = {
        enable = true,
        use_treesitter = true,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- enabled = false,
    event = "VeryLazy",
    config = function()
      local highlight = {
        "RainbowBlue",
        "RainbowOrange",
        "RainbowCyan",
        "RainbowViolet",
        "RainbowGreen",
        "RainbowRed",
        "RainbowYellow",
      }
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { link = "RainbowDelimiterRed" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { link = "RainbowDelimiterYellow" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { link = "RainbowDelimiterBlue" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { link = "RainbowDelimiterOrange" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { link = "RainbowDelimiterGreen" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { link = "RainbowDelimiterViolet" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { link = "RainbowDelimiterCyan" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

      require("ibl").setup({
        indent = {
          char = "▏",
        },
        exclude = {
          filetypes = {
            "alpha",
            "NvimTree",
          },
        },
        scope = {
          highlight = highlight,
        },
      })
    end,
  },
  {
    "b0o/incline.nvim",
    opts = {
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        if modified then
          filename = filename .. " ●"
        end
        return {
          ft_icon
              and { " ", ft_icon, " ", guibg = ft_color, guifg = require("incline.helpers").contrast_color(ft_color) }
            or "",
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          " ",
          guibg = "#44406e",
        }
      end,
    },
  },
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local ui = Xray.config.icons.ui
      math.randomseed(os.time())

      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        [[                                                 ]],
        [[                                                 ]],
        [[                                                 ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", ui.FindFile .. "  Find file", "<cmd>Telescope find_files<cr>"),
        -- dashboard.button("p", ui.Project .. "  Find project", "<cmd>Telescope projects<cr>"),
        dashboard.button("o", ui.RecentFile .. "  Recently used files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("l", ui.Clock2 .. "  Load last session", "<cmd>SessionManager load_current_dir_session<cr>"),
        dashboard.button("g", ui.GrepString .. "  Find text", "<cmd>Telescope live_grep<cr>"),
        dashboard.button(
          "c",
          ui.Gear .. "  Browse nvim config file",
          "<cmd>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<cr>"
        ),
        dashboard.button("M", ui.ToolBox .. "  Open Mason Home", "<cmd>Mason<cr>"),
        dashboard.button("P", ui.Socket .. "  Open Plugin Manager", "<cmd>Lazy<cr>"),
        dashboard.button("Q", ui.Out .. "  Quit Neovim", "<cmd>qa<cr>"),
      }

      local function footer()
        local total_plugins = #vim.tbl_keys(require("lazy").plugins())
        local datetime = os.date(ui.Calendar .. " %d-%m-%Y " .. ui.Clock1 .. " %H:%M:%S")
        return ui.Socket .. " " .. total_plugins .. " plugins " .. datetime
      end

      dashboard.section.footer.val = footer()

      alpha.setup(dashboard.opts)
    end,
  },
}
