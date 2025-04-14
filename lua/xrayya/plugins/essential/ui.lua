local convert_to_hex = LOAD_UTIL("color-functions").convert_decimal_to_hex

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
      ---@diagnostic disable-next-line: missing-fields
      require("noice").setup({
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
      })

      vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
        if not require("noice.lsp").scroll(1) then
          return "<c-f>"
        end
      end, { silent = true, expr = true })

      vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
        if not require("noice.lsp").scroll(-1) then
          return "<c-b>"
        end
      end, { silent = true, expr = true })
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
    "sphamba/smear-cursor.nvim",
    config = function()
      require("smear_cursor").setup({})
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  {
    "y3owk1n/undo-glow.nvim",
    enabled = false,
    event = { "VeryLazy" },
    ---@type UndoGlow.Config
    opts = {
      animation = {
        enabled = true,
        duration = 300,
        animtion_type = "zoom",
        window_scoped = false,
      },
      highlights = {
        undo = {
          hl_color = { bg = convert_to_hex(vim.api.nvim_get_hl(0, { name = "rainbowdelimiterred" }).fg) or "#693232" },
        },
        redo = {
          -- hl_color = { bg = convert_to_hex(vim.api.nvim_get_hl(0, { name = "RainbowDelimiterGreen" }).fg) or "#2F4640" },
          hl_color = { bg = convert_to_hex(vim.api.nvim_get_hl(0, { name = "RainbowDelimiterRed" }).fg) or "#693232" },
        },
        search = {
          hl_color = { bg = convert_to_hex(vim.api.nvim_get_hl(0, { name = "rainbowdelimiterviolet" }).fg) or "#5c475c" },
        },
        comment = {
          hl_color = { bg = convert_to_hex(vim.api.nvim_get_hl(0, { name = "RainbowDelimiterOrange" }).fg) or "#7A5A3D" },
        },
        cursor = {
          hl_color = { bg = convert_to_hex(vim.api.nvim_get_hl(0, { name = "RainbowDelimiterRed" }).fg) or "#793D54" },
        },
      },
      priority = 2048 * 3,
    },
    keys = {
      {
        "u",
        function()
          require("undo-glow").undo()
        end,
        mode = "n",
        desc = "Undo with highlight",
        noremap = true,
      },
      {
        "U",
        function()
          require("undo-glow").redo()
        end,
        mode = "n",
        desc = "Redo with highlight",
        noremap = true,
      },
      {
        "p",
        function()
          require("undo-glow").paste_below()
        end,
        mode = "n",
        desc = "Paste below with highlight",
        noremap = true,
      },
      {
        "P",
        function()
          require("undo-glow").paste_above()
        end,
        mode = "n",
        desc = "Paste above with highlight",
        noremap = true,
      },
      {
        "n",
        function()
          require("undo-glow").search_next({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search next with highlight",
        noremap = true,
      },
      {
        "N",
        function()
          require("undo-glow").search_prev({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search prev with highlight",
        noremap = true,
      },
      {
        "*",
        function()
          require("undo-glow").search_star({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search star with highlight",
        noremap = true,
      },
      {
        "#",
        function()
          require("undo-glow").search_hash({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search hash with highlight",
        noremap = true,
      },
      {
        "gc",
        function()
          -- This is an implementation to preserve the cursor position
          local pos = vim.fn.getpos(".")
          vim.schedule(function()
            vim.fn.setpos(".", pos)
          end)
          return require("undo-glow").comment()
        end,
        mode = { "n", "x" },
        desc = "Toggle comment with highlight",
        expr = true,
        noremap = true,
      },
      {
        "gc",
        function()
          require("undo-glow").comment_textobject()
        end,
        mode = "o",
        desc = "Comment textobject with highlight",
        noremap = true,
      },
      {
        "gcc",
        function()
          return require("undo-glow").comment_line()
        end,
        mode = "n",
        desc = "Toggle comment line with highlight",
        expr = true,
        noremap = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        callback = function()
          require("undo-glow").yank()
        end,
      })

      -- This only handles neovim instance and do not highlight when switching panes in tmux
      vim.api.nvim_create_autocmd("CursorMoved", {
        desc = "Highlight when cursor moved significantly",
        callback = function()
          require("undo-glow").cursor_moved({
            animation = {
              animation_type = "slide",
            },
          })
        end,
      })

      -- This will handle highlights when focus gained, including switching panes in tmux
      vim.api.nvim_create_autocmd("FocusGained", {
        desc = "Highlight when focus gained",
        callback = function()
          ---@type UndoGlow.CommandOpts
          local opts = {
            animation = {
              animation_type = "slide",
            },
          }

          opts = require("undo-glow.utils").merge_command_opts("UgCursor", opts)
          local current_row = vim.api.nvim_win_get_cursor(0)[1]
          local cur_line = vim.api.nvim_get_current_line()
          require("undo-glow").highlight_region(vim.tbl_extend("force", opts, {
            s_row = current_row - 1,
            s_col = 0,
            e_row = current_row - 1,
            e_col = #cur_line,
            force_edge = opts.force_edge == nil and true or opts.force_edge,
          }))
        end,
      })

      vim.api.nvim_create_autocmd("CmdLineLeave", {
        pattern = { "/", "?" },
        desc = "Highlight when search cmdline leave",
        callback = function()
          require("undo-glow").search_cmd({
            animation = {
              animation_type = "fade",
            },
          })
        end,
      })
    end,
  },
  {
    "shellRaining/hlchunk.nvim",
    enabled = false,
    config = function()
      require("hlchunk").setup({
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
      })
    end,
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
        hide = {
          cursorline = true,
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
