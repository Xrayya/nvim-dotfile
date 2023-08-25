return {
	-- cmd = {'' .. vim.fn.stdpath('data') .. '/mason/bin/lua-language-server.cmd'};
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			hint = {
				enable = true,
				arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
				await = true,
				paramName = "All", -- "All", "Literal", "Disable"
				paramType = true,
				semicolon = "SameLine", -- "All", "SameLine", "Disable"
				setType = true,
			},
			runtime = {
				special = {
					reload = "require",
				},
				version = "LuaJIT",
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					[vim.fn.stdpath("config") .. "/ftplugin"] = true,
					[vim.fn.stdpath("data") .. "/site/pack"] = true,
					vim.api.nvim_get_runtime_file("", true),
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
