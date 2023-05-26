local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/octo.nvim' }

M.dependencies = {
    { git .. '/nui.nvim' },
    { git .. '/plenary.nvim' },
    { git .. '/nvim-web-devicons' },
}

M.event = "VeryLazy"

M.config = function()
    local status, octo = pcall(require, 'octo')
    if not status then return end

    octo.setup {}
end

return M

-- https://github.com/pwntester/octo.nvim