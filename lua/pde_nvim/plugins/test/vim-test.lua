local M = { 'vim-test/vim-test' }

M.config = function()
    local map = require('lua.utils').map

    map('n', '<Leader>tn', ':TestNearest<cr>', { desc = 'Test nearest' })
    map('n', '<Leader>tf', ':TestFile<cr>', { desc = 'Test file' })
    map('n', '<Leader>ts', ':TestSuite<cr>', { desc = 'Test suite' })
    map('n', '<Leader>tl', ':TestLast<cr>', { desc = 'Test last' })
    map('n', '<Leader>tv', ':TestVisit<cr>', { desc = 'Test visit' })
end

return M

-- https://github.com/vim-test/vim-test
-- https://github.com/jessarcher/dotfiles/blob/master/nvim/lua/user/plugins/vim-test.lua