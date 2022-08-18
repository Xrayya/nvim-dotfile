return {
  settings = {
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    -- javascript = {
    --   inlayHints = {
    --     enumMemberValues = {
    --       enabled = true,
    --     },
    --     functionLikeReturnTypes = {
    --       enabled = true,
    --     },
    --     parameterNames = {
    --       enabled = "all",
    --       suppressWhenArgumentMatchesName = false,
    --     },
    --     parameterTypes = {
    --       enabled = true,
    --     },
    --     propertyDeclarationTypes = {
    --       enabled = true,
    --     },
    --     variableTypes = {
    --       enabled = true,
    --       suppressWhenTypeMatchesName = true,
    --     },
    --   },
    -- },
  },
}
