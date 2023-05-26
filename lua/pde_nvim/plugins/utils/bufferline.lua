local g = vim.g
local git = g.git_username or 'taftadahir'
-- local namespace = g.namespace or 'pde_nvim'

-- local helpers_status, helpers = pcall(require, namespace .. '.helpers')
-- if not helpers_status then return end

-- local map = helpers.map

local M = { git .. '/bufferline.nvim' }

-- M.after = "catppuccin"

-- M.dependencies = {
-- 	{ git .. '/nvim-web-devicons' }
-- }

M.event = 'VeryLazy'

M.config = function()
	local status, bufferline = pcall(require, 'bufferline')
	if not status then return end

	bufferline.setup {
		options = {
			-- close_command = function(n)
			-- 	require("mini.bufremove").delete(n, false)
			-- end,
			-- right_mouse_command = function(n)
			-- 	require("mini.bufremove").delete(n, false)
			-- end,
			show_buffer_close_icons = false,
			always_show_bufferline = false,
			-- diagnostics = 'nvim_lsp',
			-- diagnostics_update_in_insert = true,
			close_icon = '',
			left_trunc_marker = '',
			right_trunc_marker = '',
			show_close_icon = false,
			style_preset = bufferline.style_preset.no_italic,
			numbers = function(opts)
				return string.format("%s", opts.ordinal)
			end,
			-- tab_size = 0,
			max_name_length = 40,
			separator_style = { '', '' },
			-- modified_icon = '',
			indicator = {
				icon = ' ',
				style = 'none',
			},
			offsets = {
				{
					filetype = 'NvimTree',
					text = function()
						return '  ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					text_align = 'center',
					separator = true
				},
				{
					filetype = 'neo-tree',
					text = function()
						return '  ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					text_align = 'center',
					separator = true
				}
				-- {
				-- 	filetype = "tagbar",
				-- 	text = "Tag Bar",
				-- 	highlight = "Directory",
				-- 	separator = true
				-- },
			},
			hover = {
				enabled = true,
				delay = 200,
				reveal = { 'close' }
			},
			custom_areas = {
				left = function()
					return {
						{ text = '    ' },
					}
				end,
			},
			-- groups = {
			-- 	items = {
			-- 		require('bufferline.groups').builtin.pinned:with({ icon = "" })
			-- 	}
			-- }
		},
		-- highlights = require("catppuccin.groups.integrations.bufferline").get()
	}

	-- map('n', '<tab>', ':BufferLineCycleNext<cr>', { desc = 'Next buffer' }) -- <c-tab>
	-- map('n', '<s-tab>', ':BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
	-- map('n', 'bp', ':BufferLineTogglePin<cr>', { desc = 'Toggle pin buffer' })
end

M.keys = {
    { '<tab>', ':BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<s-tab>', ':BufferLineCyclePrev<cr>', desc = 'Previous buffer' }
}

return M

-- https://github.com/akinsho/bufferline.nvim