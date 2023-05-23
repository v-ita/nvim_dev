local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-colorizer.lua' }

M.config = function()
    local status, colorizer = pcall(require, 'colorizer')
    if not status then return end

    colorizer.setup({
        '*';
    })
end

return M

-- https://github.com/norcalli/nvim-colorizer.lua