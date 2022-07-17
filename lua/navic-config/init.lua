local navic = require("functions").notifreq("nvim-navic", "navic-config", "error")
if navic == nil then
  return
end

local _icons = require("icons")

-- stylua: ignore
navic.setup({
  icons = {
    Method        = _icons.kind.Method .. " ",
    Function      = _icons.kind.Function .. " ",
    Constructor   = _icons.kind.Constructor .. " ",
    Field         = _icons.kind.Field .. " ",
    Variable      = _icons.kind.Variable .. " ",
    Class         = _icons.kind.Class .. " ",
    Interface     = _icons.kind.Interface .. " ",
    Module        = _icons.kind.Module .. " ",
    Property      = _icons.kind.Property .. " ",
    Enum          = _icons.kind.Enum .. " ",
    File          = _icons.kind.File .. " ",
    EnumMember    = _icons.kind.EnumMember .. " ",
    Constant      = _icons.kind.Constant .. " ",
    Struct        = _icons.kind.Struct .. " ",
    Event         = _icons.kind.Event .. " ",
    Operator      = _icons.kind.Operator .. " ",
    TypeParameter = _icons.kind.TypeParameter .. " ",

    Boolean = _icons.type.Boolean .. " ",
    Number  = _icons.type.Number .. " ",
    String  = _icons.type.String .. " ",
    Array   = _icons.type.Array .. " ",
    Object  = _icons.type.Object .. " ",

    Namespace = _icons.other_symbols.Namespace .. " ",
    Package   = _icons.other_symbols.Package .. " ",
    Key       = _icons.other_symbols.Key .. " ",
    Null      = _icons.other_symbols.Null .. " ",
  },

  highlight = true,
  separator = " " .. _icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
})

vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, link = "CmpItemKindMethod" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, link = "CmpItemKindFunction" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, link = "CmpItemKindConstructor" })
vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, link = "CmpItemKindField" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, link = "CmpItemKindClass" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, link = "CmpItemKindInterface" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, link = "CmpItemKindModule" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, link = "CmpItemKindProperty" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, link = "CmpItemKindEnum" })
vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, link = "CmpItemKindDefault" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, link = "CmpItemKindEnumMember" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, link = "CmpItemKindConstant" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, link = "CmpItemKindStruct" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, link = "CmpItemKindEvent" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, link = "CmpItemKindEvent" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, link = "CmpItemKindTypeParameter" })

vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, link = "CmpItemKindValue" })

vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, link = "CmpItemKindModule" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, link = "CmpItemKindModule" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, link = "CmpItemKindValue" })

vim.api.nvim_set_hl(0, "NavicText", { default = true, fg = "#8d8d8d" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, fg = "#FFFFFF" })
