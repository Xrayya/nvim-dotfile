local function create_advanced_lsp_config_list(configs)
  local advanced_lsp_config = {}

  for _, config in pairs(configs) do
    table.insert(advanced_lsp_config, 1, require("xrayya.setup.lsp.advanced-lsp-config." .. config))
  end
  return advanced_lsp_config
end

return create_advanced_lsp_config_list({
  "flutter-tools",
  "typescript-tools",
})
