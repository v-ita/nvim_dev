local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-ts-autotag' }

M.ft = { 'html', 'javascript', 'xml', 'vue', 'markdown', 'php' }

-- M.dependencies = {
	-- { 'AndrewRadev/tagalong.vim' },
	-- { git .. '/MatchTag' }
-- }

M.config = function()
	local status, auto_tag = pcall(require, 'nvim-ts-autotag')
	if not status then return end

	local filetypes = {
		'html',
		'javascript',
		'typescript',
		'javascriptreact',
		'typescriptreact',
		'svelte',
		'vue',
		'tsx',
		'jsx',
		'rescript',
		'xml',
		'php',
		'markdown',
		'glimmer',
		'handlebars',
		'hbs'
	}

	local skip_tags = {
		'area',
		'base',
		'br',
		'col',
		'command',
		'embed',
		'hr',
		'img',
		'slot',
		'input',
		'keygen',
		'link',
		'meta',
		'param',
		'source',
		'track',
		'wbr',
		'menuitem'
	}

	auto_tag.setup({
		enable = true,
		filetypes = filetypes,
		skip_tags = skip_tags
	})
end

return M

-- https://github.com/windwp/nvim-ts-autotag
-- https://github.com/gregsexton/MatchTag