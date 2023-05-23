local settings_status, settings = pcall(require, 'settings')
if not settings_status then return end

local git = settings.git

local M = { git .. '/onedark.nvim' }

M.config = function ()
	local status, onedark = pcall(require, 'onedark')
	if not status then return end

	onedark.setup {
		style = 'darker', -- darker, dark, cool, deep, warm, warmer
	}
end

-- indent-blankline plugin
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=none gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

return M

-- https://github.com/navarasu/onedark.nvim