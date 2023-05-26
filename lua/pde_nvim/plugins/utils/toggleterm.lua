local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/toggleterm.nvim' }

M.cmd = { 'ToggleTerm', 'ToggleTermToggleAll', 'TermExec' }

M.config = function()
	local status, toggleterm = pcall(require, 'toggleterm')
	if not status then return end

	toggleterm.setup {
		-- size = function(term)
		-- 	if term.direction == "horizontal" then
		-- 		return 15
		-- 	elseif term.direction == "vertical" then
		-- 		return vim.o.columns * 0.4
		-- 	end
		-- end,
		shell = '/bin/zsh',
		direction = 'float',
		open_mapping = [[<f9>]],
		terminal_mappings = true,
		float_opts = {
			border = 'curved' -- single, curved, double, shadow
		},
		highlights = {
			FloatBorder = {
				guifg = "#000000",
			},
		},
	}
end

-- map('n', '<f9>', ':ToggleTerm<cr>', { desc = 'Toggle Terminal' })

M.keys = {
	{ '<f9>', ':ToggleTerm<cr>', desc = 'Toggle Terminal' },
	-- { [[<C-\>]],          "<cmd>ToggleTerm<cr>",                      desc = "Toggle Terminal" },
	-- { [[<leader>\f]],     "<cmd>ToggleTerm direction=float<cr>",      desc = "ToggleTerm float" },
	-- { [[<leader>\h]],     "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
	-- { [[<leader>\v]],     "<cmd>ToggleTerm direction=vertical<cr>",   desc = "ToggleTerm vertical split" },
	-- { [[<leader>\<tab>]], "<cmd>ToggleTerm direction=tab<cr>",        desc = "ToggleTerm tab" },
	-- { [[<leader>\a]],     "<cmd>ToggleTermToggleAll<cr>",             desc = "ToggleTerm all at once" },
	-- { [[<leader>\n]],     "<cmd>ToggleTermSetName<cr>",               desc = "Set Terminal Name" },
}

return M

-- https://github.com/akinsho/toggleterm.nvim
