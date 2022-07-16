local lualine = require("functions").notifreq("lualine", "lualine-config.my-lualine", "error")
if lualine == nil then
  return
end

local status_ok, components = pcall(require, "lualine-config.my-lualine.components")
if not status_ok then
  vim.notify(
    'lualine-config.my-lualine: error occured when attempt to call "lualine-config.my-lualine.components"',
    "error",
    { title = "nvim config file: error" }
  )
  vim.notify("using default settings", "info", {
    title = "lualine.nvim",
  })

  return
end

lualine.setup({
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
      components.filetype,
      components.filename,
      components.filesize,
      components.branch,
      components.diff,
    },
    lualine_x = {
      components.diagnostics,
      components.lsp,
      components.treesitter,
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
