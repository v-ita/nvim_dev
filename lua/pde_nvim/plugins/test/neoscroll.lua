local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/neoscroll.nvim' }

M.keys = {
    "<C-u>",
    "<C-d>",
    "<C-b>",
    "<C-f>",
}

M.config = function()
    local status, neoscroll = pcall(require, 'neoscroll')
    if not status then return end

    neoscroll.setup {}
end

return M

-- https://github.com/karb94/neoscroll.nvim
