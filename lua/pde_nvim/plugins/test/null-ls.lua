local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/null-ls.nvim' }

M.dependencies = {
	{ git .. '/cspell.nvim' }
}

M.event = { 'BufReadPost', 'BufNewFile' }

M.config = function()
	local status, null_ls = pcall(require, 'null-ls')
	if not status then return end

	local has_eslint_config = function(u)
		return u.root_has_file('.eslintrc') or u.root_has_file('.eslintrc.json') or u.root_has_file('.eslintrc.js')
	end

	local has_exec = function(exec)
		return vim.fn.executable(exec)
	end

	local cspell = require('cspell')

	local formatting = null_ls.builtins.formatting
	local code_actions = null_ls.builtins.code_actions
	local completions = null_ls.builtins.completion
	local diagnostics = null_ls.builtins.diagnostics
	local hover = null_ls.builtins.hover
	local command_resolver = require('null-ls.helpers.command_resolver')

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end

	null_ls.setup {
		debug = false,
		on_attach = on_attach,
		sources = {
			formatting.yamlfmt,
			formatting.csharpier,
			formatting.prettier.with {
				extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
				extra_filetypes = { "toml", "solidity" },
				filetypes = { "html", "yaml", "markdown" }
			},
			formatting.stylua.with {
				extra_args = { '--quote-style AutoPreferSingle' },
				condition = function()
					return has_exec('stylua')
				end,
			},
			formatting.blade_formatter,
			formatting.dart_format,
			formatting.black.with {
				condition = function()
					return has_exec('black')
				end,
			},
			formatting.isort,
			formatting.shfmt.with({
				extra_args = { '-i', '2', '-bn', '-ci', '-sr' },
				condition = function()
					return has_exec('shfmt')
				end,
			}),             -- sh
			formatting.markdownlint, -- markdown
			formatting.eslint.with({
				dynamic_command = function(params)
					return command_resolver.from_yarn_pnp(params)
						or command_resolver.from_node_modules(params)
						or vim.fn.executable(params.command) == 1 and params.command
				end,
			}),              -- js
			formatting.terraform_fmt, -- terraform
			formatting.clang_format.with {
				filetypes = { "cpp", "c" },
			},
			formatting.prettierd.with({
				condition = function()
					return has_exec('prettierd')
				end,
				env = {
					PRETTIERD_DEFAULT_CONFIG = vim.fn.getcwd() .. '/.prettierrc',
				},
			}),
			formatting.gofumpt,
			formatting.autopep8,
			formatting.jq,

			cspell.diagnostics,
			diagnostics.php,
			diagnostics.zsh,
			diagnostics.flake8,
			diagnostics.shellcheck, --sh
			diagnostics.markdownlint, --markdown
			diagnostics.eslint.with({
				dynamic_command = function(params)
					return command_resolver.from_yarn_pnp(params)
						or command_resolver.from_node_modules(params)
						or vim.fn.executable(params.command) == 1 and params.command
				end,
			}), -- js
			diagnostics.rubocop,
			diagnostics.codespell.with({
				filetypes = { "markdown", "text" },
			}),

			code_actions.gitsigns,
			code_actions.eslint.with({
				dynamic_command = function(params)
					return command_resolver.from_yarn_pnp(params)
						or command_resolver.from_node_modules(params)
						or vim.fn.executable(params.command) == 1 and params.command
				end,
				condition = has_eslint_config,
				prefer_local = 'node_modules/.bin',
			}), -- js
			cspell.code_actions,

			completions.luasnip,
			completions.spell,

			hover.dictionary,
			hover.printenv,
		},
	}
end

return M

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- https://www.reddit.com/r/neovim/comments/133vug0/how_to_setup_prettier_with_lsp/
-- https://github.com/davidmh/cspell.nvim
