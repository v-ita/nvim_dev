local status, schemastore = pcall(require, 'schemastore')
if not status then
	return {
		settings = {}
	}
end

return {
	settings = {
		json = {
			schemas = schemastore.json.schemas {
				select = {
					'Alacritty Configuration Schema',
					'composer.json',
					'package.json',
					'pubspec.yaml'
				}
			},
			validate = { enable = true }
		}
	}
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
-- https://github.com/b0o/SchemaStore.nvim