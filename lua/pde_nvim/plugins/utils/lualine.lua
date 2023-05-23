local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/lualine.nvim' }

-- M.dependencies = {
-- 	{ git .. '/nvim-web-devicons' }
-- }

M.config = function()
	local status, lualine = pcall(require, 'lualine')
	if not status then return end

	lualine.setup {
		-- theme = 'gruvbox_dark',  	-- onedark, solarized_dark, gruvbox, gruvbox_dark, everforest, dracula, ayu_mirage, ayu_dark
		options = {
			section_separators = { left = '', right = '' },
			component_separators = { left = '', right = '' },
			globalstatus = true,
			-- disabled_filetypes = {
			-- 	statusline = {
			-- 		'NvimTree',
			-- 		'tagbar',
			-- 		'Outline'
			-- 	},
			-- 	winbar = {
			-- 		'NvimTree',
			-- 		'tagbar',
			-- 		'Trouble'
			-- 	},
			-- },
		},
		-- lualine_x = {
		-- 	{
		-- 		require('noice').api.statusline.mode.get,
		-- 		cond = require('noice').api.statusline.mode.has,
		-- 		color = { fg = '#ff9e64' }
		-- 	}
		-- }
	}
end

return M

-- https://github.com/nvim-lualine/lualine.nvim