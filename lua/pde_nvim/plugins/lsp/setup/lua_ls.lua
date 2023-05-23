return {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim', 'pcall', 'require' },
			},
			telemetry = {
				enable = false,
			},
			completion = {
				callSnippet = 'Replace'
			}
		},
	},
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua