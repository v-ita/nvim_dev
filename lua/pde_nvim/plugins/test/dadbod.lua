local M = { 'tpope/vim-dadbod' }

M.requires = { 
    { 'kristijanhusak/vim-dadbod-ui' },
    { 'kristijanhusak/vim-dadbod-completion' },
    { 'tpope/vim-dotenv' }
}

M.config = function()
    vim.g.db_ui_save_location = '~/.config/nvim/db_ui'

    vim.cmd [[let g:db_ui_show_help = 0]]
    vim.cmd [[let g:db_ui_use_nerd_fonts = 1]]
    vim.cmd [[let g:db_ui_show_database_icon = 1]]
    vim.cmd [[let g:db_ui_win_position = 'right']]
    vim.cmd [[let g:db_ui_auto_execute_table_helpers = 1]]

    local map = require('lua.utils').map
    map('n', '<leader>db', ':tab DBUI<cr>', { desc = 'DB UI open' })
    map('n', '<leader>du', ':DBUIToggle<cr>', { desc = 'Toggle DB UI' })
end

return M

-- https://github.com/tpope/vim-dadbod
-- https://github.com/kristijanhusak/vim-dadbod-ui
-- https://github.com/kristijanhusak/vim-dadbod-completion
-- https://github.com/tpope/vim-dotenv