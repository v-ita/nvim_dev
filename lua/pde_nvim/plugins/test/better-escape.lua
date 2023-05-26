local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/better-escape.nvim' }

M.config = function()
    local status, bscape = pcall(require, 'better_escape')
    if not status then return end

    bscape.setup {
        mapping = {"jk"}
    }
end

return M

-- https://github.com/max397574/better-escape.nvim
