local icons = LOAD_UTIL("icons")

local custom_extension = {
  telescope = {
    sections = {
      lualine_a = {
        function()
          return icons.ui.Telescope .. " Telescope"
        end,
      },
    },
    filetypes = { "TelescopePrompt" },
  },
  color_picker = {
    sections = {
      lualine_a = {
        function()
          return icons.kind.Color .. " Color Picker"
        end,
      },
    },
    filetypes = { "color-picker" },
  },
  lspinfo = {
    sections = {
      lualine_a = {
        function()
          return icons.ui.LSP .. " LSP Info"
        end,
      },
    },
    filetypes = { "lspinfo" },
  },
  null_ls_info = {
    sections = {
      lualine_a = {
        function()
          return icons.ui.LSP .. " Null LS Info"
        end,
      },
    },
    filetypes = { "null-ls-info" },
  },
  sagaoutline = {
    sections = {
      lualine_a = {
        function()
          return icons.ui.LSP .. " LSP Saga Outline"
        end,
      },
    },
    filetypes = { "sagaoutline" },
  },
  trouble = {
    sections = {
      lualine_a = {
        function()
          return "Trouble"
        end,
      },
    },
    filetypes = { "Trouble" },
  },
  lazy = {
    sections = {
      lualine_a = {
        function()
          return icons.ui.Socket .. " Lazy"
        end,
      },
    },
    filetypes = { "lazy" },
  },
  mason = {
    sections = {
      lualine_a = {
        function()
          return icons.ui.ToolBox .. " Mason"
        end,
      },
    },
    filetypes = { "mason" },
  },
  lazygit = {
    sections = {
      lualine_a = {
        function()
          return " LazyGit"
        end,
      },
    },
    filetypes = { "lazygit" },
  },
}

return custom_extension
