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
			-- schemas = {
			-- 	{
			-- 		fileMatch = { "package.json" },
			-- 		url = "https://json.schemastore.org/package.json"
			-- 	},
			-- 	{
			-- 		fileMatch = { "tsconfig*.json" },
			-- 		url = "https://json.schemastore.org/tsconfig.json"
			-- 	},
			-- 	{
			-- 		fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
			-- 		url = "https://json.schemastore.org/prettierrc.json"
			-- 	},
			-- 	{
			-- 		fileMatch = { ".eslintrc", ".eslintrc.json" },
			-- 		url = "https://json.schemastore.org/eslintrc.json"
			-- 	},
			-- 	{
			-- 		fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
			-- 		url = "https://json.schemastore.org/babelrc.json"
			-- 	},
			-- 	{
			-- 		fileMatch = { "lerna.json" },
			-- 		url = "https://json.schemastore.org/lerna.json"
			-- 	},
			-- 	{
			-- 		fileMatch = { "now.json", "vercel.json" },
			-- 		url = "https://json.schemastore.org/now.json"
			-- 	},
			-- 	{
			-- 		fileMatch = { "ecosystem.json" },
			-- 		url = "https://json.schemastore.org/pm2-ecosystem.json"
			-- 	},
			-- },
			validate = { enable = true }
		}
	}
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
-- https://github.com/b0o/SchemaStore.nvim
