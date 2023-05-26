local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-neoclip.lua' }

M.dependencies = {
    { git .. '/sqlite.lua', module = 'sqlite' },
}

M.event = "VeryLazy"

M.config = function()
    local status, neoclip = pcall(require, 'neoclip')
    if not status then return end

    neoclip.setup {}
end

return M

-- https://github.com/AckslD/nvim-neoclip.lua