local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/which-key.nvim' }

M.event = "VeryLazy"

M.config = function()
	local status, which_key = pcall(require, 'which-key')
	if not status then return end

	which_key.setup {
		window = {
            border = 'none', -- none, single, double, shadow
            position = 'bottom', -- bottom, top
            margin = { 0, 1, 0, 1 },
			spacing= 3,
            -- padding = { 2, 0, 2, 2 },
        },
		layout = {
            height = { min = 3, max = 24 },
            -- width = { min = 20, max = 50 },
			align = 'left', -- align columns left, center or right
        },
		-- icons = {
			-- symbol used in the command line area that shows your active key combo
			-- breadcrumb = '»',
			-- symbol used between a key and it's label
			-- separator = '➜',
			-- symbol prepended to a group
			-- group = '… ',
		-- },
	}

	-- which_key.register({
	-- 	e = {
	-- 		name = 'explorer'
	-- 	},
	-- 	l = {
	-- 		name = 'lsp'
	-- 	},
	-- 	f = {
	-- 		name = 'fuzzy find'
	-- 	},
	-- 	g = {
	-- 		name = 'git'
	-- 	},
	-- 	-- r = {
	-- 	-- 	name = 'rest client'
	-- 	-- },
	-- 	s = {
	-- 		name = 'split'
	-- 	},
	-- }, { prefix = '<leader>'})
end

return M

-- https://github.com/folke/which-key.nvim