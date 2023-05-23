local M = { 'weilbith/nvim-code-action-menu' }

M.cmd = 'CodeActionMenu'

vim.g.code_action_menu_show_details = true
vim.g.code_action_menu_show_diff = true
vim.g.code_action_menu_show_action_kind = true

local map = require('lua.utils').map
map({'v', 'n'}, '<leader>ca', ':CodeActionMenu<CR>', { desc = 'Code action' })

-- M.config = function()
-- end

return M

-- https://github.com/weilbith/nvim-code-action-menu