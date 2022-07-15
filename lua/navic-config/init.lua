local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  vim.notify('navic-config: failed to load "nvim-navic" module')
  return
end

local icons = require("icons")

-- stylua: ignore
navic.setup({
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = "ﰠ ",
    Field         = " ",
    Constructor   = " ",
    Enum          = " ",
    Interface     = " ",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = "𝓐 ",
    Number        = " ",
    Boolean       = "﨡 ",
    Array         = " ",
    Object        = "⦿ ",
    Key           = "🔐",
    Null          = "NULL ",
    EnumMember    = " ",
    Struct        = "𝓢 ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },

  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
})

vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, link = "TSURI" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, link = "TSInclude" })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, link = "TSNamespace" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, link = "TSNamespace" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, link = "TSType" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, link = "TSMethod" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, link = "TSMethod" })
vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, link = "TSField" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, link = "TSConstructor" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, link = "TSType" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, link = "TSType" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, link = "TSFunction" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, link = "TSConstant" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, link = "TSConstant" })
vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, link = "TSString" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, link = "TSNumber" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, link = "TSBoolean" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, link = "TSConstant" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, link = "TSType" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, link = "TSType" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, link = "TSType" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, link = "TSField" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, link = "TSType" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, link = "TSType" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, link = "TSOperator" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, link = "TSParameter" })
vim.api.nvim_set_hl(0, "NavicText", { default = true, fg = "#8d8d8d" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, fg = "#FFFFFF" })
