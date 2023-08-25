local g = vim.g
local git = g.git_username or 'taftadahir'

-- local helpers_status, helpers = pcall(require, namespace .. '.helpers')
-- if not helpers_status then return end

-- local map = helpers.map

local M = { git .. '/nvim-tree.lua' }

-- M.dependencies = { 
-- 	{ git .. '/nvim-web-devicons', opt = true },
-- }

M.config = function()
	local status, nvim_tree = pcall(require, 'nvim-tree')
	if not status then return end

	nvim_tree.setup {
		disable_netrw = true,
		hijack_cursor = true,
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			-- icons = { hint = '', info = '', warning = '', error = '' }
			-- icons = { hint = '', info = '', warning = '', error = '' }
		},
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = false
			}
		},
		view = {
			adaptive_size = true,
			signcolumn = 'yes',
		},
		live_filter = {
			prefix = '',
		},
		filters = {
			dotfiles = false,
			-- custom = {},
			exclude = { '.env' },
		},
		renderer = {
			add_trailing = true,
			group_empty = true,
			root_folder_label = true,
			highlight_opened_files = 'name',
			highlight_git = true,
			icons = {
				show = {
					folder = true,
					file = true,
					folder_arrow = false,
					git = false,
				}
			},
			indent_markers = {
				enable = true
			},
		},
		git = {
			ignore = false,
		},
	}

	-- map('n', '<leader>et', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle explorer' })
	-- map('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<cr>', { desc = 'Find file toggle' })
end

M.keys = {
    { '<leader>et', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle explorer' },
    { '<leader>ef', '<cmd>NvimTreeFindFileToggle<cr>', desc = 'Find file toggle' }
}

M.cmd = { 'NvimTree', 'NvimTreeToggle', 'NvimTreeFocus', 'NvimTreeClose' }

return M

-- nvim-tree cheat sheet
-- g? : open nvimtree keymap

-- https://github.com/nvim-tree/nvim-tree.lua
