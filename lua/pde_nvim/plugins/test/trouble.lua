local utils = require('lua.utils')
local git = utils.git
local map = utils.map

local M = { git .. '/trouble.nvim' }

M.dependencies = {
	{ git .. '/nvim-web-devicons' }
}

M.cmd = { "Trouble", "TroubleToggle" }

M.config = function()
	local status, trouble = pcall(require, 'trouble')
	if not status then return end

	trouble.setup {
		height = 8,
	}

	map('n', '<leader>lw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { desc = 'Trouble toggle workspace diagnostic' }) -- leader xw
	map('n', '<leader>lt', '<cmd>TroubleToggle<cr>', { desc = 'Trouble toggle' }) -- leader xx
end

return M

-- https://github.com/folke/trouble.nvim