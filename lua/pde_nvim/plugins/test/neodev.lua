local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/neodev.nvim' }

M.config = function()
    local status, neodev = pcall(require, 'neodev')
    if not status then return end

    neodev.setup {
        library = { plugins = { "neotest" }, types = true},
    }
end

return M

-- https://github.com/folke/neodev.nvim