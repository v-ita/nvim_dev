local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/toggleterm.nvim' }

M.cmd = { 'ToggleTerm', 'ToggleTermToggleAll' }

M.config = function()
	local status, toggleterm = pcall(require, 'toggleterm')
	if not status then return end

	toggleterm.setup {
		shell = '/bin/zsh',
		direction = 'float',
		open_mapping = [[<f9>]],
		terminal_mappings = true,
		float_opts = {
			border = 'curved' -- single, curved, double, shadow
		}
	}
end

-- map('n', '<f9>', ':ToggleTerm<cr>', { desc = 'Toggle Terminal' })

M.keys = {
    { '<f9>', ':ToggleTerm<cr>', desc = 'Toggle Terminal' },
}

return M

-- https://github.com/akinsho/toggleterm.nvim