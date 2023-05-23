local status, null_ls = pcall(require, "null-ls")
if not status then return end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local completions = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
	debug = false,
	sources = {
		formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
		formatting.stylua.with { extra_args = { "--quote-style AutoPreferSingle" } },
		formatting.blade_formatter,
		formatting.dart_format,

		diagnostics.php,
		diagnostics.zsh,

		code_actions.gitsigns,

		completions.luasnip,
	},
}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md