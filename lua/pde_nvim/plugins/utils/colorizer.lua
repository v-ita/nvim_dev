local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-colorizer.lua' }

M.event = { "BufReadPost", "BufNewFile" }

M.ft = {}

M.config = function()
    local status, colorizer = pcall(require, 'colorizer')
    if not status then return end

    colorizer.setup({
        '*',
        filetypes = {
            'html',
            'css',
            'javascript',
            'typescript',
            'typescriptreact',
            'javascriptreact',
            'lua'
        },
        user_default_options = {
            mode = "background",
            tailwind = false, -- Enable tailwind colors
        }
    })
end

return M

-- https://github.com/norcalli/nvim-colorizer.lua
