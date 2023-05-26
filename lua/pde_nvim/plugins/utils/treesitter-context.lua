local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-treesitter-context' }

M.config = function()
	local status, ctx = pcall(require, 'treesitter-context')
	if not status then return end

    ctx.setup {}
end

return M

-- https://github.com/nvim-treesitter/nvim-treesitter-context