local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/deadcolumn.nvim' }

M.event = 'VeryLazy'

M.config = function()
    local status, deadcolumn = pcall(require, 'deadcolumn')
	if not status then return end

    deadcolumn.setup {
        warning = {
            alpha = 0.3,
            colorcode = "#F38BA8",
        }
    }
end

return M

-- https://www.reddit.com/r/neovim/comments/1220o2l/new_plugin_deadcolumnnvim_gradually_show_you/