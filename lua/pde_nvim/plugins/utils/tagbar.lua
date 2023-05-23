local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/tagbar' }

M.config = function()
    -- map('n', '<f8>', ':TagbarToggle<cr>', { desc = 'Toggle tagbar' }) -- leader T
end

M.keys = {
    { '<f8>', ':TagbarToggle<cr>', desc = 'Toggle tagbar' },
}

return M

-- https://github.com/preservim/tagbar