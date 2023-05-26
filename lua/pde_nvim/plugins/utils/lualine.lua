local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/lualine.nvim' }

-- M.dependencies = {
-- 	{ git .. '/nvim-web-devicons' }
-- }

M.event = "VimEnter"

M.config = function()
	local status, lualine = pcall(require, 'lualine')
	if not status then return end

	lualine.setup {
		-- theme = 'gruvbox_dark',  	-- onedark, solarized_dark, gruvbox, gruvbox_dark, everforest, dracula, ayu_mirage, ayu_dark, nordic
		options = {
			icons_enabled = true,
			-- theme = 'molokai',
			section_separators = { left = '', right = '' },
			component_separators = { left = '', right = '' },
			-- 	component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
			-- ignore_focus = {},
			-- always_divide_middle = true,
			globalstatus = true,
			-- disabled_filetypes = {
			-- 	statusline = {
			-- 		'NvimTree',
			-- 		'tagbar',
			-- 		'Outline',
			--		'merginal',
			--		'oil',
			-- 	},
			-- 	winbar = {
			-- 		'NvimTree',
			-- 		'tagbar',
			-- 		'Trouble'
					-- "merginal",
					-- "fugitive",
					-- "packer",
					-- "netrw",
					-- "Outline",
					-- "text",
					-- "log",
					-- "help",
					-- "Jaq",
					-- "qf",
				-- "oil"
			-- 	},
			-- },
		},
		-- lualine_x = {
		-- 	{
		-- 		require('noice').api.statusline.mode.get,
		-- 		cond = require('noice').api.statusline.mode.has,
		-- 		color = { fg = '#ff9e64' }
		-- 	}
		-- },
		-- extensions = {
		-- 	"neo-tree",
		-- 	"quickfix",
		-- 	"fugitive",
		-- 	"fzf",
		-- 	"lazy",
		-- 	"symbols-outline",
		-- 	"trouble",
        -- "nvim-dap-ui",
        -- "toggleterm",
		--   }
	}
end

return M

-- https://github.com/nvim-lualine/lualine.nvim