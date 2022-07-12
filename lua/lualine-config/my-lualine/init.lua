local components = require("lualine-config.my-lualine.components")

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree", "alpha" },
  },
  sections = {
    lualine_a = {
      components.mode,
    },
    lualine_b = {},
    lualine_c = {
      components.filename,
      components.filesize,
      components.branch,
      components.diff,
    },
    lualine_x = {
      components.diagnostics,
      components.lsp,
      components.treesitter,
      components.filetype,
      components.spaces,
      components.fileformat,
      components.encoding,
      components.location,
      components.scrollbar,
    },
    lualine_y = {},
    lualine_z = {},
  },
})
