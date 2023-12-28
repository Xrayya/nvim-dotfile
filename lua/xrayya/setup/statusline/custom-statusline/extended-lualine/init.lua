local import_el_module = function(module)
  return require("xrayya.setup.statusline.custom-statusline.extended-lualine." .. module)
end

local components = import_el_module("components")
local custom_extension = import_el_module("custom-extension")

local extended_lualine = {
  options = {
    disabled_filetypes = {
      "alpha",
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
    "nvim-dap-ui",
    "nvim-tree",
    custom_extension.color_picker,
    custom_extension.lspinfo,
    custom_extension.null_ls_info,
    custom_extension.sagaoutline,
    custom_extension.lazy,
    custom_extension.mason,
    custom_extension.telescope,
    custom_extension.trouble,
    custom_extension.lazygit,
  },
}

return extended_lualine
