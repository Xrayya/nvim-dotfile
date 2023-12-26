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
          return "LSP Info"
        end,
      },
    },
    filetypes = { "lspinfo" },
  },
  null_ls_info = {
    sections = {
      lualine_a = {
        function()
          return "Null LS Info"
        end,
      },
    },
    filetypes = { "null-ls-info" },
  },
  sagaoutline = {
    sections = {
      lualine_a = {
        function()
          return "LSP Saga Outline"
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
          return "Lazy"
        end,
      },
    },
    filetypes = { "lazy" },
  },
  mason = {
    sections = {
      lualine_a = {
        function()
          return "Mason"
        end,
      },
    },
    filetypes = { "mason" },
  },
}

return custom_extension
