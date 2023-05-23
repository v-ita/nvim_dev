local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/barbecue.nvim' }

M.name = 'barbecue'

M.dependencies = {
    -- { git .. '/nvim-lspconfig' },
    { git .. '/nvim-navic' },
--     { git .. '/nvim-web-devicons' }
}

M.config = function()
    local status, barbecue = pcall(require, 'barbecue')
    if not status then return end

    barbecue.setup {}

    local ui_status, barbecue_ui = pcall(require, 'barbecue.ui')
    if not ui_status then return end

    barbecue_ui.toggle(true)
end

return M

-- https://github.com/utilyre/barbecue.nvim