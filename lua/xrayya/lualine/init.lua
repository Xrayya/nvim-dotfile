local lualine = NOTIF_REQ("lualine", "lualine-config", "error")
if lualine == nil then
  return
end

lualine.setup({
  extensions = { "symbols-outline", "toggleterm" },
  disabled_filetypes = { "NvimTree", "alpha" },
})

function LOAD_CUSTOM_LUALINE_STYLE(theme)
  local status_ok, opts = pcall(require, "xrayya.lualine.custom-lualine." .. theme)
  if not status_ok then
    vim.notify("lualine-cofig: failed to load \"" ..  "\" lualine style", "error", {
      title = "nvim config file: error"
    })
    vim.notify("lualine-cofig: use default lualine style", "info", {
      title = "nvim config file: info"
    })
  else
    lualine.setup(opts)
  end
end

LOAD_CUSTOM_LUALINE_STYLE("my-lualine")
