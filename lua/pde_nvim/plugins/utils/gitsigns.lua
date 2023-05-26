local g = vim.g
local git = g.git_username or 'taftadahir'
-- local namespace = g.namespace or 'pde_nvim'

-- local helpers_status, helpers = pcall(require, namespace .. '.helpers')
-- if not helpers_status then return end

-- local map = helpers.map

local M = { git .. '/gitsigns.nvim' }

M.dependencies = {
    { git .. '/plenary.nvim' }
}

-- M.lazy = false

M.cmd = {
    'Gitsigns',
}

M.event = {
    'BufEnter', "BufReadPre", "BufNewFile"
}

-- M.init = function()
--     vim.api.nvim_create_autocmd({ 'BufRead' }, {
--         group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
--         callback = function()
--             vim.fn.system('git -C ' .. vim.fn.expand('%:p:h') .. ' rev-parse')
--             if vim.v.shell_error == 0 then
--                 vim.api.nvim_del_augroup_by_name('GitSignsLazyLoad')
--                 vim.schedule(function()
--                     require('lazy').load({ plugins = 'gitsigns.nvim' })
--                 end, 0)
--             end
--         end,
--     })
-- end

M.config = function()
    local status, gitsigns = pcall(require, 'gitsigns')
    if not status then return end

    gitsigns.setup {
        -- linehl = false,
        -- numhl = true,
        -- yadm = { enable = false },
        -- signs = {
        --     add          = { text = '' },
        --     change       = { text = '~' },
        --     delete       = { text = '_' },
        --     topdelete    = { text = '‾' },
        --     changedelete = { text = '~' },
        --     untracked    = { text = '┆' },
        -- },
    }

    -- map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<cr>', { desc = 'Gitsigns reset hunk' }) -- leader hr
    -- map('n', '<leader>gp', ':Gitsigns preview_hunk<cr>', { desc = 'Gitsigns preview hunk' })      -- leader hp
    -- map('n', '<leader>gn', ':Gitsigns next_hunk<cr>', { desc = 'Gitsigns next hunk' })            -- leader hn
    -- map('n', '<leader>gd', ':Gitsigns diffthis<cr>', { desc = 'Gitsigns diffthis' })
end

M.keys = {
    { '<leader>gp', ':Gitsigns preview_hunk<cr>', desc = 'Gitsigns preview hunk' },
    { '<leader>gr', ':Gitsigns reset_hunk<cr>',   desc = 'Gitsigns reset hunk' },
    { '<leader>gn', ':Gitsigns next_hunk<cr>',    desc = 'Gitsigns next hunk' },
    { '<leader>gd', ':Gitsigns diffthis<cr>',     desc = 'Gitsigns diffthis' }
}

return M

-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/nvim-lua/plenary.nvim
