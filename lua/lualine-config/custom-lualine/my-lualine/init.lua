local lualine = NOTIF_REQ("lualine", "lualine-config.custom-lualine.my-lualine", "error")
if lualine == nil then
  return
end

local status_ok, components = pcall(require, "lualine-config.custom-lualine.my-lualine.components")
if not status_ok then
  vim.notify(
    'lualine-config.custom-lualine.my-lualine: error occured when attempt to call "lualine-config.my-lualine.components"',
    "error",
    { title = "nvim config file: error" }
  )
  vim.notify("lualine-cofig: use default lualine style", "info", {
    title = "nvim config file: info",
  })

  return
end

return {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      "NvimTree",
      "alpha",
      "TelescopePrompt",
      "JABSwindow",
      "lspinfo",
      "mason",
      "null-ls-info",
      "packer",
      "Trouble",
    },
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
}
