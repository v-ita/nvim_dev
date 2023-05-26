local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/pretty-fold.nvim' }

M.event = "InsertEnter"

M.config = function ()
    local status, fold = pcall(require, 'pretty-fold')
    if not status then return end

    fold.setup {}
end

return M

-- https://github.com/anuvyklack/pretty-fold.nvim