local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-ufo' }

M.dependencies = {
    { git .. '/promise-async'}
}

M.config = function()
    local status, ufo = pcall(require, 'ufo')
    if not status then return end

    ufo.setup { }
end

return M

-- https://github.com/kevinhwang91/nvim-ufo
-- https://github.com/kevinhwang91/promise-async