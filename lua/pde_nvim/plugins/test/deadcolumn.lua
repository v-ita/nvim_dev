local utils = require('lua.utils')
local git = utils.git

local M = { git .. '/deadcolumn.nvim' }

M.config = function()
    local status, deadcolumn = pcall(require, 'deadcolumn')
	if not status then return end

    deadcolumn.setup {
        warning = {
            alpha = 1,
            colorcode = "#F38BA8",
        }
    }
end

return M