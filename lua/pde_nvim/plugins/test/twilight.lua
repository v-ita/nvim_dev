local M = { 'folke/twilight.nvim' }

M.config = function()
    local status, twilight = pcall(require, 'twilight')
    if not status then return end

    twilight.setup {
        treesitter = true,
        context = 8,
        expand = {
            'function',
            'method',
            'table',
            'if_statement',
        }
    }

    local map = require('lua.utils').map
    map('n', '<leader>z', ':Twilight<cr>', { desc ='Twilight toggle' })
end

return M

-- https://github.com/folke/twilight.nvim