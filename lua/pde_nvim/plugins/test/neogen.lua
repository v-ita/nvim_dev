local M = { 'danymat/neogen' }

M.requires = 'nvim-treesitter/nvim-treesitter'

M.config = function()
    local status, neogen = pcall(require, 'neogen')
    if not status then return end

    neogen.setup {}
end

return M

-- https://github.com/danymat/neogen