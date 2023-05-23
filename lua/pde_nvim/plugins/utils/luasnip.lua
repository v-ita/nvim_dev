local g = vim.g
local git = g.git_username or 'taftadahir'
local namespace = g.namespace or 'pde_nvim'

local helpers_status, helpers = pcall(require, namespace .. '.helpers')
if not helpers_status then return end

local map = helpers.map

local M = { git .. '/LuaSnip' }

M.dependencies = {
	{ git .. '/friendly-snippets' },
	{ git .. '/cmp_luasnip' },
}

M.config = function()
	local lua_status, luasnip = pcall(require, 'luasnip')
	if not lua_status then return end

	-- require('luasnip.loaders.from_vscode').load({ paths = { vim.fn.stdpath('data') .. '/site/pack/packer/start/friendly-snippets' } })
	-- require('luasnip.loaders.from_vscode').load({ paths = { vim.fn.stdpath('data') .. '/lazy/friendly-snippets' } })
	require("luasnip.loaders.from_vscode").lazy_load()

	luasnip.config.set_config({
		history = true,
		enable_autosnippets = true
	})

	map({ 'i', 's' }, '<c-n>', "<cmd>lua require'luasnip'.jump(1)<cr>", { desc = 'Snippet jump next' })
	map({ 'i', 's' }, '<c-p>', "<cmd>lua require'luasnip'.jump(-1)<cr>", { desc = 'Snippet jump previous' })
end

return M
-- https://github.com/saadparwaiz1/cmp_luasnip