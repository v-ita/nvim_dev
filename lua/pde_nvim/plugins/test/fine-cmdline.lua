local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/fine-cmdline.nvim' }

M.dependencies = {
    { git .. '/nui.nvim' }
}

M.config = function()
    local status, cmdline = pcall(require, 'fine-cmdline')
    if not status then return end

    cmdline.setup {
        -- cmdline = {
        --     enable_keymaps = true,
        --     smart_history = true,
        --     prompt = ': '
        -- },
        -- popup = {
        --     position = {
        --         row = '10%',
        --         col = '50%',
        --     },
        --     size = {
        --         width = '60%',
        --     },
        --     border = {
        --         style = 'rounded',
        --     },
        --     win_options = {
        --         winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
        --     },
        -- },
        -- hooks = {
        --     before_mount = function(input)
        --         -- code
        --     end,
        --     after_mount = function(input)
        --         -- code
        --     end,
        --     set_keymaps = function(imap, feedkeys)
        --         -- code
        --     end
        -- }
    }
end

return M

-- https://github.com/VonHeikemen/fine-cmdline.nvim
