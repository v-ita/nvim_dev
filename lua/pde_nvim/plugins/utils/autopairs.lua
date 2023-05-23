local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-autopairs' }

M.config = function()
    local status, npairs = pcall(require, 'nvim-autopairs')
    if not status then return end

    npairs.setup({
        check_ts = true,
        disable_filetype = { 'TelescopePrompt' },
    })
end

return M

-- https://github.com/windwp/nvim-autopairs