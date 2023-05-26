capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

return {
	settings = {
		tailwindCSS = {
			classAttributes = { 'class', 'className', 'classList', 'ngClass' },
			lint = {
				cssConflict = 'warning',
				invalidApply = 'error',
				invalidConfigPath = 'error',
				invalidScreen = 'error',
				invalidTailwindDirective = 'error',
				invalidVariant = 'error',
				recommendedVariantOrder = 'warning'
			},
			-- experimental = {
			-- 	classRegex = {
			-- 		"tw`([^`]*)",
			-- 		'tw="([^"]*)',
			-- 		'tw={"([^"}]*)',
			-- 		"tw\\.\\w+`([^`]*)",
			-- 		"tw\\(.*?\\)`([^`]*)",
			-- 		{ "clsx\\(([^)]*)\\)",       "(?:'|\"|`)([^']*)(?:'|\"|`)" },
			-- 		{ "classnames\\(([^)]*)\\)", "'([^']*)'" },
			-- 		{ "cva\\(([^)]*)\\)",        "[\"'`]([^\"'`]*).*?[\"'`]" },
			-- 	},
			-- },
			validate = true
		}
	},
	init_options = {
		userLanguages = {
			eelixir = "html-eex",
			eruby = "erb",
		},
	},
	filetypes = { "html", "mdx", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
	on_attach = function(client, bufnr)
		if client.server_capabilities.colorProvider then
			require("lsp/utils/documentcolors").buf_attach(bufnr)
			require("colorizer").attach_to_buffer(
				bufnr,
				{ mode = "background", css = true, names = false, tailwind = false }
			)
		end
	end,
	capabilities = capabilities
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss
