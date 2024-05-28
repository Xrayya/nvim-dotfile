local ui = {
  {
    "folke/noice.nvim",
    -- enabled = false,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup()
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")

      vim.notify = notify

      local opts = {
        timeout = 1000,
        fps = 30,
      }
      if vim.g.has_no_bg_highlight then
        opts.background_colour = "#000000"
      end
      notify.setup(opts)
    end,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  {
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
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
    config = function()
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          if modified then
            filename = filename .. " ●"
          end
          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#44406e",
          }
        end,
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local ui = LOAD_UTIL("icons").ui
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

return ui
