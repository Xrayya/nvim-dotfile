---@type LazySpec
return {
  {
    "tzachar/cmp-tabnine",
    build = vim.fn.has("win32") > 0 and "powershell ./install.ps1" or "./install.sh",
  },
}
