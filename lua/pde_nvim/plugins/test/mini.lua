local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/mini.nvim' }

M.config = function()
    local status, animate = pcall(require, 'mini.animate')
    if not status then return end

    animate.setup {}
end

return M

-- https://github.com/echasnovski/mini.nvim
