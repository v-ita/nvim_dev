local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-treesitter' }

M.build = ':TSUpdate'

-- http parser have issue
-- this resolve it
-- https://github.com/rest-nvim/rest.nvim/issues/191
M.commit = 'eedc5198a1b4bb1b08ae6d4f64f3d76e376957aa'

M.dependencies = {
	{ git .. '/nvim-ts-rainbow' },
}

M.config = function()
	local status, treesitter = pcall(require, 'nvim-treesitter.configs')
	if not status then return end

	-- local ensure_installed = { 'bash', 'comment', 'css', 'dart', 'diff', 'html', 'http', 'javascript', 'jsdoc', 'json', 'gitattributes', 'gitcommit', 'gitignore', 'lua', 'markdown', 'php', 'phpdoc', 'scss', 'sql', 'vim', 'vue', 'yaml' }
	local ensure_installed = {  }
	local ignore_install = {  }

	local setup = {
		ensure_installed = ensure_installed,
		sync_install = true,
		auto_install = true,
		ignore_install = ignore_install,
		highlight = {
			enable = true,
			disable = { 'NvimTree' }
		},
		indent = {
			enable = true
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil
		},
	}

	-- only when ts_context_commentstring is installed
	local ts_status, _ = pcall(require, 'ts_context_commentstring')
	if ts_status then
		setup.context_commentstring = {
			enable = true,
			enable_autocmd = false,
			config = {
				css = '/* %s */',
				html = '<!-- %s -->',
				javascript = '// %s',
				php = '# %s',
				lua = '-- %s',
				sql = '-- %s',
			}
		}
	end

	-- only when nvim-autopairs is installed
	local npairs_status, npairs = pcall(require, 'nvim-autopairs')
    if npairs_status then
		npairs.autopairs = {
			enable = true
		}
	end

	treesitter.setup (setup)
end

-- vim.api.nvim_exec([[
-- 	set foldmethod = expr -- expr, manual, suntax, indent, marker, diff
-- 	set foldexpr = nvim_treesitter#foldexpr()
-- 	set nofoldenable
-- ]], true)

return M

-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/jessarcher/dotfiles/blob/master/nvim/lua/user/plugins/treesitter.lua
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring