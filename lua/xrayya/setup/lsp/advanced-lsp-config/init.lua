local advanced_lsp_config = {}

local function import_advanced_lsp_config(name)
	table.insert(advanced_lsp_config, 1, require("xrayya.setup.lsp.advanced-lsp-config." .. name))
end

import_advanced_lsp_config("flutter-tools")
import_advanced_lsp_config("typescript-tools")

return advanced_lsp_config
