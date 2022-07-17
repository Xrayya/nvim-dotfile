local icons = require("icons")

vim.g.symbols_outline = {
  width = 35,
  --stylua: ignore
  symbols = {
    Method        = { icon = icons.kind.Method, hl = "TSMethod" },
    Function      = { icon = icons.kind.Function, hl = "TSFunction" },
    Constructor   = { icon = icons.kind.Constructor, hl = "TSConstructor" },
    Field         = { icon = icons.kind.Field, hl = "TSField" },
    Variable      = { icon = icons.kind.Variable, hl = "TSConstant" },
    Class         = { icon = icons.kind.Class, hl = "TSType" },
    Interface     = { icon = icons.kind.Interface, hl = "TSType" },
    Module        = { icon = icons.kind.Module, hl = "TSNamespace" },
    Property      = { icon = icons.kind.Property, hl = "TSMethod" },
    Enum          = { icon = icons.kind.Enum, hl = "TSType" },
    File          = { icon = icons.kind.File, hl = "TSURI" },
    EnumMember    = { icon = icons.kind.EnumMember, hl = "TSField" },
    Constant      = { icon = icons.kind.Constant, hl = "TSConstant" },
    Struct        = { icon = icons.kind.Struct, hl = "TSType" },
    Event         = { icon = icons.kind.Event, hl = "TSType" },
    Operator      = { icon = icons.kind.Operator, hl = "TSOperator" },
    TypeParameter = { icon = icons.kind.TypeParameter, hl = "TSParameter" },

    Boolean       = { icon = icons.type.Boolean, hl = "TSBoolean" },
    Number        = { icon = icons.type.Number, hl = "TSNumber" },
    String        = { icon = icons.type.String, hl = "TSString" },
    Array         = { icon = icons.type.Array, hl = "TSConstant" },
    Object        = { icon = icons.type.Object, hl = "TSType" },

    Namespace     = { icon = icons.other_symbols.Namespace, hl = "TSNamespace" },
    Package       = { icon = icons.other_symbols.Package, hl = "TSNamespace" },
    Key           = { icon = icons.other_symbols.Key, hl = "TSType" },
    Null          = { icon = icons.other_symbols.Null, hl = "TSType" },
  },
}
