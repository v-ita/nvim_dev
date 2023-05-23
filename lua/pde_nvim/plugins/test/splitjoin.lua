local M = { 'AndrewRadev/splitjoin.vim' }

M.config = function()
    vim.cmd [[let g:splitjoin_quiet = 1]]

    local map = require('utils').map
    map('n', '<leader>gS', ':SplitjoinSplit<cr>', { desc = 'Split join split' })
    map('n', '<leader>gJ', ':SplitjoinJoin<cr>', { desc = 'Split join join' })
end

return M

-- https://github.com/AndrewRadev/splitjoin.vim