local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/refactoring.nvim' }

M.dependencies = {
    { git .. '/plenary.nvim' },
}

M.config = function()
    local status, refactoring = pcall(require, 'refactoring')
    if not status then return end

    refactoring.setup {}
end

return M

-- https://github.com/ThePrimeagen/refactoring.nvim