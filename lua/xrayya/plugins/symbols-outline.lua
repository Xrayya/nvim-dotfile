local icons = LOAD_UTIL("icons")

local symbols_outline = {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
      max_width = { 60, 0.45 },
      min_width = 15,
      filter_kind = false,
      icons = {
        Array = icons.type.Array,
        Boolean = icons.type.Boolean,
        Class = icons.kind.Class,
        Constant = icons.kind.Constant,
        Constructor = icons.kind.Constructor,
        Enum = icons.kind.Enum,
        EnumMember = icons.kind.EnumMember,
        Event = icons.kind.Event,
        Field = icons.kind.Field,
        File = icons.kind.File,
        Function = icons.kind.Function,
        Interface = icons.kind.Interface,
        Key = icons.other_symbols.Key,
        Method = icons.kind.Method,
        Module = icons.kind.Module,
        Namespace = icons.other_symbols.Namespace,
        Null = icons.other_symbols.Null,
        Number = icons.type.Number,
        Object = icons.type.Object,
        Operator = icons.kind.Operator,
        Package = icons.other_symbols.Package,
        Property = icons.kind.Property,
        String = icons.type.String,
        Struct = icons.kind.Struct,
        TypeParameter = icons.kind.TypeParameter,
        Variable = icons.kind.Variable,
      },
    })
  end,
}

return symbols_outline
