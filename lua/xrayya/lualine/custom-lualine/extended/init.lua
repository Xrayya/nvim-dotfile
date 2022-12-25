local lualine = NOTIF_REQ("lualine", "xrayya.lualine.custom-lualine.extended", "error")
if lualine == nil then
  return
end

local status_ok, components = pcall(require, "xrayya.lualine.custom-lualine.extended.components")
if not status_ok then
  vim.notify(
    'xrayya.luline.custom-lualine.extended: error occured when attempt to call "xrayya.lualine.extended.components"',
    "error",
    { title = "nvim config file: error" }
  )
  vim.notify("xrayya.lualine: use default lualine style", "info", {
    title = "nvim config file: info",
  })

  return
end

local icons = require("icons")

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
  packer = {
    sections = {
      lualine_a = {
        function()
          return "Packer"
        end,
      },
    },
    filetypes = { "packer" },
  },
}

return {
  options = {
    disabled_filetypes = {
      "alpha",
      "mason"
    },
  },
  sections = {
    lualine_a = { components.mode },
    lualine_b = { components.filename },
    lualine_c = { components.branch, components.diff },
    lualine_x = { components.diagnostics, components.lsp },
    lualine_y = { components.encoding, components.fileformat, components.filetype },
    lualine_z = { components.location, components.progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    "quickfix",
    "symbols-outline",
    "toggleterm",
    "nvim-dap-ui",
    "nvim-tree",
    custom_extension.color_picker,
    custom_extension.lspinfo,
    custom_extension.null_ls_info,
    custom_extension.packer,
    custom_extension.telescope,
    custom_extension.trouble,
  },
}
