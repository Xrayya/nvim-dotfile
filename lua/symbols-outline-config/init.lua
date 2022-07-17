local icons = require("icons")

vim.g.symbols_outline = {
  width = 35,
  --stylua: ignore
  symbols = {
    Method        = { icon = icons.kind.Method, hl = "CmpItemKindMethod" },
    Function      = { icon = icons.kind.Function, hl = "CmpItemKindFunction" },
    Constructor   = { icon = icons.kind.Constructor, hl = "CmpItemKindConstructor" },
    Field         = { icon = icons.kind.Field, hl = "CmpItemKindField" },
    Variable      = { icon = icons.kind.Variable, hl = "CmpItemKindVariable" },
    Class         = { icon = icons.kind.Class, hl = "CmpItemKindClass" },
    Interface     = { icon = icons.kind.Interface, hl = "CmpItemKindInterface" },
    Module        = { icon = icons.kind.Module, hl = "CmpItemKindModule" },
    Property      = { icon = icons.kind.Property, hl = "CmpItemKindProperty" },
    Enum          = { icon = icons.kind.Enum, hl = "CmpItemKindEnum" },
    File          = { icon = icons.kind.File, hl = "CmpItemKindDefault" },
    EnumMember    = { icon = icons.kind.EnumMember, hl = "CmpItemKindEnumMember" },
    Constant      = { icon = icons.kind.Constant, hl = "CmpItemKindConstant" },
    Struct        = { icon = icons.kind.Struct, hl = "CmpItemKindStruct" },
    Event         = { icon = icons.kind.Event, hl = "CmpItemKindEvent" },
    Operator      = { icon = icons.kind.Operator, hl = "CmpItemKindOperator" },
    TypeParameter = { icon = icons.kind.TypeParameter, hl = "CmpItemKindTypeParameter" },

    Boolean = { icon = icons.type.Boolean, hl = "CmpItemKindValue" },
    Number  = { icon = icons.type.Number, hl = "CmpItemKindValue" },
    String  = { icon = icons.type.String, hl = "CmpItemKindValue" },
    Array   = { icon = icons.type.Array, hl = "CmpItemKindVariable" },
    Object  = { icon = icons.type.Object, hl = "CmpItemKindValue" },

    Namespace = { icon = icons.other_symbols.Namespace, hl = "CmpItemKindModule" },
    Package   = { icon = icons.other_symbols.Package, hl = "CmpItemKindModule" },
    Key       = { icon = icons.other_symbols.Key, hl = "CmpItemKindKeyword" },
    Null      = { icon = icons.other_symbols.Null, hl = "CmpItemKindValue" },
  },
}
